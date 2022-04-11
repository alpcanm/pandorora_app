library reset_password_page;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pandorora_app/view/pages/authentication_pages/reset_password_page/cubit/reset_password_cubit.dart';
import 'package:pandorora_app/view/theme/decorations.dart';
import 'package:pandorora_app/view/widgets/_/_print_message.dart';
import 'package:pandorora_app/view/widgets/_/_validators.dart';

import '../../../constants/consts_size.dart';

import '../../../widgets/components/custom_rounded_rectangle_card.dart';

part 'components/reset_password_appbar.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cubit = ResetPasswordCubit();
    return Scaffold(
      appBar: const _RegisterAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _cubit.formKey,
          child: ListView(children: [
            TextFormField(
              controller: _cubit.mailcontroller,
              validator: Validators.mailValidator,
              decoration: Decorations.inputDecoration(context, "Mail"),
            ),
            const SizedBox(height: 16),
            TextButton(
                onPressed: () {
                  _cubit.resetPassword().then((value) {
                    if (value) {
                      PrintMessage.showSucces(context);
                    } else {
                      PrintMessage.showFailed(
                          context, "Bir şeyler ters gitti.");
                    }
                  });
                },
                child: const Text("Şifre sıfırlama bağlantısı gönder"))
          ]),
        ),
      ),
    );
  }
}
