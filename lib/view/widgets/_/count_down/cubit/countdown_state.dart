part of 'countdown_cubit.dart';

class CountdownState extends Equatable {
  const CountdownState(this.day, this.hour, this.minute);

  final int day;
  final int hour;
  final int minute;

  CountdownState copyWith(int day, int hour, int minute) {
    return CountdownState(day, hour, minute);
  }

  @override
  List<Object> get props => [day, hour, minute];
}
