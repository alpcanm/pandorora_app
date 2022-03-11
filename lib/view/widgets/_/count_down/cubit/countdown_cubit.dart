import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'countdown_state.dart';

class CountdownCubit extends Cubit<CountdownState> {
  final DateTime raffleDateTime;

  CountdownCubit(
    this.raffleDateTime,
  ) : super(const CountdownState(0, 0, 0)) {
    setTime();
  }

  setTime() {
    final _result = _countDownCalculator(raffleDateTime);
    emit(CountdownState(_result.day, _result.hour, _result.minute));
  }

  DateTime _countDownCalculator(DateTime value) {
    final _futureDate = DateTime(value.year, value.month,
        value.day, value.hour, value.minute);
    final _now = DateTime.now();
    final _minutes = _futureDate.difference(_now).inMinutes;
    final _hours = _minutes / 60;
    final _calculatedDday = (_hours / 24).floor();
    final _calculatedHour = (_hours - _calculatedDday * 24).floor();
    final _calculatedMinutes =
        (_minutes - _calculatedDday * 24 * 60 - _calculatedHour * 60);
    return DateTime(0, 0, _calculatedDday, _calculatedHour, _calculatedMinutes);
  }
}
