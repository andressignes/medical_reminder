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
                const ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Licencia'),
                  subtitle: Text(
                      'Esta obra está sujeta a una licencia de Reconocimiento-NoComercial-SinObraDerivada 3.0 España de Creative Commons'),
                ),
                InkWell(
                  onTap: () => launch('https://cima.aemps.es/'),
                  child: const ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text('Datos de medicamentos'),
                    subtitle: Text(
                        'Obtenidos de la API de CIMA (Centro de Información de Medicamentos de la AEMPS)'),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Informacion de tratamientos'),
                  subtitle: Text(
                      'Toda la informacion de los usuarios y tratamientos se almacena en Firebase.'),
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
