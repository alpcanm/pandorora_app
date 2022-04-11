import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/navigation_consts.dart';
import '../../../../../core/utils/locator_get_it.dart';
import '../../_components/profile_child_app_bar.dart';

import '../../../../widgets/_/_custom_text_form_field.dart';
import '../../_components/profile_page_button.dart';
import 'cubit/updateprofile_cubit.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileChildAppBar(context),
      body: ListView(
        children: [
          const _ProfileInputs(),
          const Divider(height: 0),
          const SizedBox(height: 8),
          ProfilePageButton.iconButton(
            text: 'Şifreyi değiştir',
            iconColor: Colors.black,
            icon: Icons.password,
            onPressed: () => context.router.navigateNamed(
                RouteConsts.UPDATE_PROFILE_PAGE +
                    "/" +
                    RouteConsts.CHANGE_PASSWORD_PAGE),
          ),
        ],
      ),
    );
  }
}

class _ProfileInputs extends StatefulWidget {
  const _ProfileInputs({Key? key}) : super(key: key);
  @override
  State<_ProfileInputs> createState() => __ProfileInputsState();
}

class __ProfileInputsState extends State<_ProfileInputs> {
  bool _isActive = false;
  @override
  Widget build(BuildContext context) {
    final _cubit = getIt<UpdateprofileCubit>();

    return Form(
      key: _cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Card(
            child: InkWell(
              onTap: () {
                setState(() {
                  _isActive = !_isActive;
                });
              },
              child: Icon(
                  _isActive ? Icons.edit_outlined : Icons.edit_off_outlined),
            ),
          ),
          const Divider(height: 0),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CustomTextFormField(
                    style: TextStyle(
                        color: !_isActive ? Colors.blueGrey : Colors.black),
                    readOnly: _isActive ? false : true,
                    onChanged: _cubit.onFieldChanged,
                    controller: _cubit.nameController,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CustomTextFormField(
                    readOnly: _isActive ? false : true,
                    style: TextStyle(
                        color: !_isActive ? Colors.blueGrey : Colors.black),
                    onChanged: _cubit.onFieldChanged,
                    controller: _cubit.raffleNickController,
                  ),
                ),
              ),
              _isActive
                  ? BlocBuilder<UpdateprofileCubit, UpdateprofileState>(
                      bloc: _cubit,
                      builder: (context, state) {
                        if (state is UpdateprofileLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return TextButton(
                            onPressed: state is UpdateprofileButtonActive
                                ? () => _cubit.update()
                                : null,
                            child: const Icon(Icons.send),
                          );
                        }
                      },
                    )
                  : const SizedBox(),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CustomTextFormField(
                    readOnly: true,
                    style: const TextStyle(color: Colors.blueGrey),
                    onChanged: _cubit.onFieldChanged,
                    controller: _cubit.mailController,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
