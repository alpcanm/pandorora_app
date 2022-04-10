import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/_/_custom_text_form_field.dart';
import '../../_components/profile_child_app_bar.dart';
import '../update_profile/cubit/updateprofile_cubit.dart';

class ChangeRaffleNickNamePage extends StatelessWidget {
  const ChangeRaffleNickNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cubit = UpdateprofileCubit();
    return Scaffold(
      appBar: ProfileChildAppBar(context),
      body: ListView(
        children: [
          CustomTextFormField(
            labelText: "Raffle Nick",
            onChanged: _cubit.onFieldChanged,
            controller: _cubit.raffleNickController,
          ),
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
        ],
      ),
    );
  }
}
