import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/profile/cubit/profile_cubit.dart';
import 'package:medical_reminder/profile/view/profile_form.dart';
import 'package:url_launcher/url_launcher.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => showAboutDialog(
              context: context,
              applicationName: l10n.medicalReminderAppBarTitle,
              applicationIcon: const Image(
                image: AssetImage('assets/icon/icon.png'),
                width: 64,
                height: 64,
              ),
              children: [
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: Text(l10n.licence_text_title),
                  subtitle: Text(l10n.licence_text_description),
                ),
                InkWell(
                  onTap: () => launch('https://cima.aemps.es/'),
                  child: ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: Text(l10n.licence_medication_title),
                    subtitle: Text(l10n.licence_medication_description),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: Text(l10n.licence_user_data_title),
                  subtitle: Text(l10n.licence_user_data_description),
                )
              ],
            ),
          )
        ],
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
