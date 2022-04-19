import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/profile/cubit/profile_cubit.dart';
import 'package:medical_reminder/profile/widgets/widgets.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<ProfileCubit, ProfileState>(
      listener: _listener,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.02,
            vertical: size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileImage(),
              const EmailTextField(),
              SizedBox(height: size.height * 0.01),
              const NameInput(),
              SizedBox(height: size.height * 0.01),
              BirthDateInput(),
              SizedBox(height: size.height * 0.01),
              const GenderInput(),
              SizedBox(height: size.height * 0.01),
              const ProfileSaveButton(),
              SizedBox(height: size.height * 0.01),
              const LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, ProfileState state) {}
}
