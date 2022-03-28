import 'package:auto_route/auto_route.dart';
import 'package:country_phone_picker/country_phone_picker.dart';
import 'package:flutter/material.dart';
import 'package:pandorora_app/core/navigation/navigation_manager.gr.dart';
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
  final _space = const SizedBox(height: 10);
  final _countryPhonePicker = CountryPhonePicker();

  @override
  void dispose() {
    _countryPhonePicker.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _registerpageCubit = context.read<RegisterpageCubit>();
    return Form(
      key: _registerpageCubit.formKey,
      child: WC.paddingAll(
        child: ListView(
          shrinkWrap: true,
          children: [
            _countryPhonePicker.dropdownWidget,
            _space,
            CustomTextFormField(
                labelText: RegisterPageText.NAME,
                controller: _registerpageCubit.nameController),
            _space,
            CustomTextFormField(
                labelText: RegisterPageText.SURNAME,
                controller: _registerpageCubit.surnameController),
            _space,
            CustomTextFormField(
                labelText: RegisterPageText.MAIL,
                customValidator: Validators.mailValidator,
                controller: _registerpageCubit.mailController),
            _space,
            _PhoneCode(
              _countryPhonePicker.valueTextWidget,
              registerpageCubit: _registerpageCubit,
            ),
            _space,
            CustomTextFormField(
                labelText: RegisterPageText.PASSWORD,
                customValidator: Validators.passwordValidator,
                obscureText: true,
                controller: _registerpageCubit.passwordController),
            _space,
            CustomTextFormField(
                labelText: RegisterPageText.CONFIRM_PASSWORD,
                obscureText: true,
                customValidator: _registerpageCubit.confirmPasswordValidator,
                controller: _registerpageCubit.confirmPassowrdController),
            _space,
            const _SubmitButton()
          ],
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
        Flexible(
          child: CustomTextFormField(
              labelText: RegisterPageText.PHONE,
              maxLengt: 10,
              customValidator: Validators.phoneValidator,
              controller: registerpageCubit.phoneController),
        )
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
          
          Future.delayed(const Duration(milliseconds: 500))
              .then((value) =>context.router.replaceAll([const AuthControllerRoute()]));
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
