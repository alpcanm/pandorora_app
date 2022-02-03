import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/_/_custom_text_form_field.dart';
import '../../../../widgets/_/_widget_consts.dart';
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
      appBar: AppBar(
        title: Text(context.widget.toString()),
      ),
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
                labelText: "Draw Nick",
                onChanged: _cubit.onFieldChanged,
                controller: _cubit.drawNickController,
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
                        label: const Text('Submit'));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
