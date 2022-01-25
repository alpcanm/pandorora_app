import 'package:bloc/bloc.dart';
import '../list.dart';

class CountryPhonePickerCubit extends Cubit<CountryPhonePickerState> {
  CountryPhonePickerCubit() : super(ContryPhonePickerInitial());

  void onChanged(String? newCountryNameValue) {
    String _newCountryCode =
        PhoneChecker.countryCodeSwitch(newCountryNameValue);
    emit(CountryPhonePickerChanged(_newCountryCode, newCountryNameValue!));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}

abstract class CountryPhonePickerState {
  const CountryPhonePickerState(
      {this.countryCode = '+43', this.countryName = 'Austria'});
  final String countryCode;
  final String countryName;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CountryPhonePickerState &&
        other.countryCode == countryCode &&
        other.countryName == countryName;
  }

  @override
  int get hashCode => countryCode.hashCode ^ countryName.hashCode;
}

class ContryPhonePickerInitial extends CountryPhonePickerState {}

class CountryPhonePickerChanged extends CountryPhonePickerState {
  const CountryPhonePickerChanged(String countryCode, String countryName)
      : super(countryCode: countryCode, countryName: countryName);
}
