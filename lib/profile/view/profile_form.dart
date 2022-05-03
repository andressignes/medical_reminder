import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/profile/cubit/profile_cubit.dart';
import 'package:medical_reminder/profile/widgets/widgets.dart';
import 'package:notification_api/notification_api.dart';

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
              // ElevatedButton(
              //   onPressed: () => NotificationApi.showScheduledNotification(
              //     body: 'hello this is a test notification from flutter. '
              //         'Ex et ea nisi in enim excepteur '
              //         'deserunt elit labore laborum nisi anim.',
              //     title: 'Notification Test',
              //     payload: 'test',
              //     scheduledDateTime:
              //         DateTime.now().add(const Duration(seconds: 5)),
              //   ),
              //   child: const Text('test'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, ProfileState state) {}
}
