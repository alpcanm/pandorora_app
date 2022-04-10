import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/navigation_consts.dart';
import '../../_components/profile_child_app_bar.dart';

import '../../../../widgets/_/_custom_text_form_field.dart';
import '../../../../widgets/_/_widget_consts.dart';
import '../../_components/profile_page_button.dart';
import 'cubit/updateprofile_cubit.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _tpDivider = WC.tpDivider;
  final _cubit = UpdateprofileCubit();

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileChildAppBar(context),
      body: WC.paddingAll(
        child: Form(
          key: _cubit.formKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: "Name",
                onChanged: _cubit.onFieldChanged,
                controller: _cubit.nameController,
              ),
              _tpDivider,
              CustomTextFormField(
                labelText: "Surname",
                onChanged: _cubit.onFieldChanged,
                controller: _cubit.surnameController,
              ),
              _tpDivider,
            
              CustomTextFormField(
                labelText: "Mail",
                onChanged: _cubit.onFieldChanged,
                controller: _cubit.mailController,
              ),
              _tpDivider,
              BlocBuilder<UpdateprofileCubit, UpdateprofileState>(
                bloc: _cubit,
                builder: (context, state) {
                  if (state is UpdateprofileLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ElevatedButton.icon(
                      onPressed: state is UpdateprofileButtonActive
                          ? () => _cubit.update()
                          : null,
                      icon: const Icon(Icons.send),
                      label: const Text('Submit'),
                    );
                  }
                },
              ),
              ProfilePageButton.iconButton(
                text: 'Şifreyi değiştir',
                iconColor: Colors.orangeAccent,
                icon: Icons.password,
                onPressed: () => context.router.navigateNamed(
                    RouteConsts.UPDATE_PROFILE_PAGE +
                        "/" +
                        RouteConsts.CHANGE_PASSWORD_PAGE),
              ),
              ProfilePageButton.iconButton(
                iconColor: Colors.redAccent,
                text: 'Telefonu Doğrula',
                icon: Icons.phone,
                onPressed: () => context.router.navigateNamed(
                    RouteConsts.UPDATE_PROFILE_PAGE +
                        "/" +
                        RouteConsts.PHONE_VERIFY_PAGE),
              ),
              ProfilePageButton.iconButton(
                iconColor: Colors.redAccent,
                text: 'Çekiliş ismini değiştir',
                icon: Icons.phone,
                onPressed: () => context.router.navigateNamed(
                    RouteConsts.UPDATE_PROFILE_PAGE +
                        "/" +
                        RouteConsts.CHANGE_RAFFLE_NICK_NAME_PAGE),
              ),
              ProfilePageButton.iconButton(
                iconColor: Colors.redAccent,
                text: 'E-posta doğrula',
                icon: Icons.phone,
                onPressed: () => context.router.navigateNamed(
                    RouteConsts.UPDATE_PROFILE_PAGE +
                        "/" +
                        RouteConsts.MAIL_VERIFY_PAGE),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
