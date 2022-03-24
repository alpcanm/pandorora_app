import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/countrycode_cubit.dart';
import 'list.dart';

class CountryPhonePicker {
  final _countryCodePickerCubit = CountryPhonePickerCubit();
  late _PhoneCodePickerDropDown dropdownWidget;
  late _ValueTextWidget valueTextWidget;
  CountryPhonePicker() {
    dropdownWidget = _PhoneCodePickerDropDown(_countryCodePickerCubit);
    valueTextWidget = _ValueTextWidget(_countryCodePickerCubit);
  }
  close() {
    _countryCodePickerCubit.close();
  }
}

class _PhoneCodePickerDropDown extends StatelessWidget {
  const _PhoneCodePickerDropDown(
    this.bloc, {
    Key? key,
  }) : super(key: key);

  final CountryPhonePickerCubit bloc;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryPhonePickerCubit, CountryPhonePickerState>(
      bloc: bloc,
      buildWhen: (previous, current) =>
          previous.countryName != current.countryName,
      builder: (context, state) {
        return DropdownButton<String>(
          value: state.countryName,
          elevation: 4,
          onChanged: bloc.onChanged,
          items: PhoneChecker.countries
              .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.black),
                        ),
                      ))
              .toList(),
        );
      },
    );
  }
}

class _ValueTextWidget extends StatelessWidget {
  const _ValueTextWidget(
    this.cubit, {
    Key? key,
  }) : super(key: key);
  final CountryPhonePickerCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryPhonePickerCubit, CountryPhonePickerState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          previous.countryName != current.countryName,
      builder: (context, state) => Text(state.countryCode),
    );
  }
}
