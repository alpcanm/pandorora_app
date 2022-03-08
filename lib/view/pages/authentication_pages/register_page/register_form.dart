import 'package:country_phone_picker/country_phone_picker.dart';
import 'package:flutter/material.dart';
import '../../../widgets/_/_custom_text_form_field.dart';
import '../../../widgets/_/_print_message.dart';
import '../../../widgets/_/_validators.dart';

import '../../../constants/view_texts.dart';
import 'cubit/registerpage_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/_/_widget_consts.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _transparentDivider = WC.tpDivider;
  final _countryPhonePicker = CountryPhonePicker();
  @override
  void dispose() {
    _countryPhonePicker.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _registerpageCubit = context.read<RegisterpageCubit>();
    return Center(
      child: Form(
        key: _registerpageCubit.formKey,
        child: WC.paddingAll(
          child: Column(
            children: [
              _countryPhonePicker.dropdownWidget,
              CustomTextFormField(
                  labelText: RegisterPageText.NAME,
                  controller: _registerpageCubit.nameController),
              _transparentDivider,
              CustomTextFormField(
                  labelText: RegisterPageText.SURNAME,
                  controller: _registerpageCubit.surnameController),
              _transparentDivider,
              CustomTextFormField(
                  labelText: RegisterPageText.MAIL,
                  customValidator: Validators.mailValidator,
                  controller: _registerpageCubit.mailController),
              _transparentDivider,
              _PhoneCode(
                _countryPhonePicker.valueTextWidget,
                registerpageCubit: _registerpageCubit,
              ),
              _transparentDivider,
              CustomTextFormField(
                  labelText: RegisterPageText.PASSWORD,
                  customValidator: Validators.passwordValidator,
                  obscureText: true,
                  controller: _registerpageCubit.passwordController),
              _transparentDivider,
              CustomTextFormField(
                  labelText: RegisterPageText.CONFIRM_PASSWORD,
                  obscureText: true,
                  customValidator: _registerpageCubit.confirmPasswordValidator,
                  controller: _registerpageCubit.confirmPassowrdController),
              _transparentDivider,
              const _SubmitButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _PhoneCode extends StatelessWidget {
  const _PhoneCode(this.phoneCode, {Key? key, required this.registerpageCubit})
      : super(key: key);
  final Widget phoneCode;
  final RegisterpageCubit registerpageCubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        phoneCode,
        const VerticalDivider(),
        CustomTextFormField(
            labelText: RegisterPageText.PHONE,
            customValidator: Validators.phoneValidator,
            controller: registerpageCubit.phoneController)
      ],
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _registerpageCubit = context.read<RegisterpageCubit>();
    return BlocListener<RegisterpageCubit, RegisterpageState>(
      listener: (context, state) {
        if (state is RegisterpageError) {
          PrintMessage.showFailed(context, state.errorMessage);
        } else if (state is RegisterpageCompleted) {
          PrintMessage.showSucces(context);
        }
      },
      child: ElevatedButton(
          onPressed: () => _registerpageCubit.formKey.currentState!.validate()
              ? _registerpageCubit.submit()
              : null,
          child: const Text(RegisterPageText.SUBMIT)),
    );
  }
}
