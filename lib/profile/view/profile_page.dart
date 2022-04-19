import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/profile/cubit/profile_cubit.dart';
import 'package:medical_reminder/profile/view/profile_form.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const ProfilePage());

  static Page page() => const MaterialPage<void>(child: ProfilePage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profilePageTitle),
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: const ProfileForm(),
      ),
    );
  }
}
