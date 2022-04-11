import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalreminder/profile/cubit/profile_cubit.dart';
import 'package:medicalreminder/profile/widgets/name_input.dart';
import 'package:medicalreminder/profile/widgets/profile_save_button.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: _listener,
      child: SingleChildScrollView(
        child: Column(
          children: const [
            NameInput(),
            ProfileSaveButton(),
          ],
        ),
      ),
    );
  }

  void _listener(BuildContext context, ProfileState state) {}
}
