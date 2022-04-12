import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalreminder/app/bloc/app_bloc.dart';
import 'package:medicalreminder/profile/view/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_profile_iconButton'),
            icon: const Icon(Icons.supervised_user_circle),
            onPressed: () => Navigator.of(context).push<void>(
              ProfilePage.route(),
            ),
          ),
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          )
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('id: ${user.id}'),
            Text('Email: ${user.email}'),
            Text('Name: ${user.name}'),
            Text('Gender ${user.gender.toString()}'),
            Text('Birth: ${user.birthDate.toString()}'),
          ],
        ),
      ),
    );
  }
}