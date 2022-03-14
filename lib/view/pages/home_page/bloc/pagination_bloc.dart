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
  PaginationBloc() : super(const PaginationState()) {
    on<PaginationAllFetched>(
      onAllFetched,
      transformer: throttleDroppable<PaginationAllFetched>(throttleDuration),
    );
    on<PaginationFilteredFetched>(
      _onFilteredSearch,
      transformer: throttleDroppable<PaginationFilteredFetched>(throttleDuration),
    );
    add(const PaginationAllFetched());
  }

  Future<void> _onFilteredSearch(
      PaginationFilteredFetched event, Emitter<PaginationState> emit) async {
    if (event.status == PaginationStatus.initial) {
      emit(
        state.copyWith(
            lastRaffleTime: _currentDate,
            hasReachedMax: false,
            status: PaginationStatus.initial,
            isFiltered: true),
      );
    }

    if (state.hasReachedMax) return;
    if (state.status == PaginationStatus.initial) {
      final _raffles =
          await _fetchRaffles(state.lastRaffleTime, filters: event.filters);
      if (_raffles != null && _raffles.isNotEmpty) {
        return emit(
          state.copyWith(
              hasReachedMax: false,
              raffles: _raffles,
              status: PaginationStatus.success,
              lastRaffleTime: _raffles.last.date,
              isFiltered: true),
        );
      } else {
        return emit(
          state.copyWith(status: PaginationStatus.failure),
        );
      }
    }
    final _prodcuts =
        await _fetchRaffles(state.lastRaffleTime, filters: event.filters);
    if (_prodcuts == null || _prodcuts.isEmpty) {
      emit(state.copyWith(hasReachedMax: true));
    } else {
      emit(
        state.copyWith(
            status: PaginationStatus.success,
            hasReachedMax: false,
            raffles: List.of(state.raffles)..addAll(_prodcuts),
            lastRaffleTime: _prodcuts.last.date,
            isFiltered: true),
      );
    }
  }

  Future<void> onAllFetched(
      PaginationAllFetched event, Emitter<PaginationState> emit) async {
    if (event.status == PaginationStatus.initial) {
      emit(
        state.copyWith(
            lastRaffleTime: _currentDate,
            hasReachedMax: false,
            status: PaginationStatus.initial,
            isFiltered: true,
            raffles: []),
      );
    }
    if (state.hasReachedMax) return;
    if (state.status == PaginationStatus.initial ||
        event.status == PaginationStatus.initial) {
      emit(state.copyWith(
          hasReachedMax: false,
          lastRaffleTime: _currentDate,
          status: PaginationStatus.loading,
          isFiltered: false));
      final _raffles = await _fetchRaffles(state.lastRaffleTime);
      if (_raffles!.isNotEmpty) {
        return emit(
          state.copyWith(
            hasReachedMax: false,
            raffles: _raffles,
            status: PaginationStatus.success,
            lastRaffleTime: _raffles.last.date,
          ),
        );
      }
    }
    final List<Raffle>? _prodcuts = await _fetchRaffles(state.lastRaffleTime);
    if (_prodcuts == null || _prodcuts.isEmpty) {
      emit(state.copyWith(hasReachedMax: true));
    } else {
      emit(
        state.copyWith(
            status: PaginationStatus.success,
            hasReachedMax: false,
            raffles: List.of(state.raffles)..addAll(_prodcuts),
            lastRaffleTime: _prodcuts.last.date),
      );
    }
  }

  Future<List<Raffle>?>? _fetchRaffles(int startAtLastRaffleTime,
      {Set<String>? filters}) async {
    return await getIt<RaffleRepository>()
        .getRaffles(startAtLastRaffleTime, filters: filters);
  }
}
