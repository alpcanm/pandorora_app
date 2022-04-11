import 'package:auto_route/auto_route.dart';
import 'package:country_phone_picker/country_phone_picker.dart';
import 'package:flutter/material.dart';
import '../../../../core/navigation/navigation_manager.gr.dart';
import '../../../widgets/_/_custom_text_form_field.dart';
import '../../../widgets/_/_print_message.dart';
import '../../../widgets/_/_validators.dart';

import '../../../constants/view_texts.dart';
import 'cubit/registerpage_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/_/_widget_consts.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  final _space = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    final _registerpageCubit = context.read<RegisterpageCubit>();
    return Form(
      key: _registerpageCubit.formKey,
      child: WC.paddingAll(
        child: ListView(
          shrinkWrap: true,
          children: [
            _space,
            TextFormField(
                decoration: _inputDecoration(context, RegisterPageText.NAME),
                controller: _registerpageCubit.nameController,
                validator: Validators.emptyValidator),
            _space,
            TextFormField(
                decoration: _inputDecoration(context, RegisterPageText.MAIL),
                validator: Validators.mailValidator,
                controller: _registerpageCubit.mailController),
            _space,
            TextFormField(
                decoration:
                    _inputDecoration(context, RegisterPageText.PASSWORD),
                validator: Validators.passwordValidator,
                obscureText: true,
                controller: _registerpageCubit.passwordController),
            _space,
            TextFormField(
                obscureText: true,
                decoration: _inputDecoration(
                    context, RegisterPageText.CONFIRM_PASSWORD),
                validator: _registerpageCubit.confirmPasswordValidator,
                controller: _registerpageCubit.confirmPassowrdController),
            _space,
            const _SubmitButton()
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(BuildContext context, String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.blueGrey),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
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

          Future.delayed(const Duration(milliseconds: 500)).then((value) =>
              context.router.replaceAll([const AuthControllerRoute()]));
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
