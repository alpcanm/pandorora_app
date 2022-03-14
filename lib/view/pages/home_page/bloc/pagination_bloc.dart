import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../../../core/models/raffle.dart';
import '../../../../core/utils/locator_get_it.dart';
import '../../../../feature/repositories/raffle_repository.dart';

part 'pagination_event.dart';
part 'pagination_state.dart';

const int _currentDate = 0;
const throttleDuration = Duration(milliseconds: 250);
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  final _raffleRepo = getIt<RaffleRepository>();
  PaginationBloc() : super(const PaginationState()) {
    on<PaginationAllFetched>(
      _onPaginationFetch,
      transformer: throttleDroppable<PaginationAllFetched>(throttleDuration),
    );

    getIt<RaffleRepository>().myRaffles().then((e) {
      add(const PaginationAllFetched());
    });
  }
  Future<void> _onPaginationFetch(
      PaginationAllFetched event, Emitter<PaginationState> emit) async {
    // eğer filtreli arama yaparsak her şeyi sıfırlamamız gerekiyor bu yüzden event.status=initial veriyoruz.
    //Bruası sadece filtreli aramalarda bir kere çalışacak.
    if (event.status == PaginationStatus.initial) {
      emit(
        state.copyWith(
            raffles: [],
            lastRaffleTime: _currentDate,
            hasReachedMax: false,
            status: PaginationStatus.initial,
            isFiltered: true),
      );
    }
    //tüm gelen başka veri yoksa direkt metoddan çıkacak.
    if (state.hasReachedMax) return;
    // PaginationFetch ilk tetiklendiğinde burası çalışacak
    if (state.status == PaginationStatus.initial) {
      final _raffles = await _raffleRepo.getRaffles(state.lastRaffleTime,
          filters: event.filters);

      if (_raffles != null && _raffles.isNotEmpty) {
        //gelen verileri içeriye atacak ve metodu sonlandıracak.
        return emit(
          state.copyWith(
              hasReachedMax: false,
              //gelen _products ı olduğu gibi içeriye atıyoruz.
              raffles: _raffles,
              status: PaginationStatus.success,
              // _products içerisindeki son verinin tarihini de içeriye atıyoruz.
              //Daha sonra bu son veriye göre greater parametresi değişiyor.
              lastRaffleTime: _raffles.last.date,
              isFiltered: true),
        );
      } else {
        //gelen veri null ise failure dönecek
        return emit(
          state.copyWith(status: PaginationStatus.failure),
        );
      }
    }
    //verileri repodan istiyoruz.
    final _products = await _raffleRepo.getRaffles(state.lastRaffleTime,
        filters: event.filters);
    if (_products == null || _products.isEmpty) {
      // Eğer gelen veri artık boşsa hasReachedMax=true olacak ve bundan sonra istek atmayacak.
      emit(state.copyWith(hasReachedMax: true));
    } else {
      // her "Daha Fazla" butonuna basıldığında burası tetiklenecek
      emit(
        state.copyWith(
            status: PaginationStatus.success,
            hasReachedMax: false,
            //gelen verileri elimizde olan listeye ekliyoruz.
            raffles: List.of(state.raffles)..addAll(_products),
            lastRaffleTime: _products.last.date,
            isFiltered: true),
      );
    }
  }
}
