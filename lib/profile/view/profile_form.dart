import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalreminder/profile/cubit/profile_cubit.dart';
import 'package:medicalreminder/profile/widgets/birth_date_input.dart';
import 'package:medicalreminder/profile/widgets/gender_input.dart';
import 'package:medicalreminder/profile/widgets/widgets.dart';

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
            children: [
              const EmailTextField(),
              SizedBox(height: size.height * 0.01),
              const NameInput(),
              SizedBox(height: size.height * 0.01),
              const BirthDateInput(),
              SizedBox(height: size.height * 0.01),
              const GenderInput(),
              SizedBox(height: size.height * 0.01),
              const ProfileSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, ProfileState state) {}
}
