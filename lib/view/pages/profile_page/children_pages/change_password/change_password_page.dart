import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/changepassword_bloc.dart';
import '../../../../widgets/_/_custom_text_form_field.dart';
import '../../../../widgets/_/_print_message.dart';
import '../../../../widgets/_/_validators.dart';
import '../../../../widgets/_/_widget_consts.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.widget.toString()),
      ),
      body: BlocProvider(
        create: (context) => ChangepasswordBloc(),
        child: const _CurrentPasswordForm(),
      ),
    );
  }
}

class _CurrentPasswordForm extends StatelessWidget {
  const _CurrentPasswordForm({Key? key}) : super(key: key);
  final _tpDivider = WC.tpDivider;
  @override
  Widget build(BuildContext context) {
    final _bloc = context.read<ChangepasswordBloc>();
    return WC.paddingAll(
      child: Form(
        key: _bloc.formKeyCurrentPassword,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(
              controller: _bloc.currentPasswordController,
              labelText: "Current Password",
              obscureText: true,
              customValidator: Validators.passwordValidator,
            ),
            _tpDivider,
            ElevatedButton(
                onPressed: () =>
                    _bloc.add(ChangepasswordConfirmCurrentPasswordRequest()),
                child: const Text('Submit')),
            _tpDivider,
            BlocBuilder<ChangepasswordBloc, ChangepasswordState>(
              buildWhen: (previous, current) =>
                  current is ChangepasswordCurrentPasswordVerified,
              builder: (context, state) {
                if (state is ChangepasswordCurrentPasswordVerified) {
                  return const _NewPasswordForm();
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _NewPasswordForm extends StatelessWidget {
  const _NewPasswordForm({Key? key}) : super(key: key);
  final _tpDivider = WC.tpDivider;
  @override
  Widget build(BuildContext context) {
    final _bloc = context.read<ChangepasswordBloc>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomTextFormField(
          controller: _bloc.newPasswordController,
          labelText: "New Password",
          obscureText: true,
          customValidator: Validators.passwordValidator,
        ),
        _tpDivider,
        CustomTextFormField(
          controller: _bloc.confirmNewPasswordController,
          labelText: "Confirm New Password",
          obscureText: true,
          customValidator: _bloc.confirmPasswordValidator,
        ),
        _tpDivider,
        BlocConsumer<ChangepasswordBloc, ChangepasswordState>(
          listener: (context, state) {
            if (state is ChangepasswordNewPasswordVerified) {
              PrintMessage.showSucces(context);
            }
          },
          builder: (context, state) {
            if (state is ChangepasswordLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ElevatedButton(
                  onPressed: () =>
                      _bloc.add(ChangepasswordChangeNewPasswordRequest()),
                  child: const Text('Change password'));
            }
          },
        ),
      ],
    );
  }
}
