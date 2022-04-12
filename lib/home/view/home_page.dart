
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalreminder/app/bloc/app_bloc.dart';
import 'package:medicalreminder/l10n/l10n.dart';
import 'package:medicalreminder/profile/view/profile_page.dart';
import 'package:medicalreminder/search_medication/view/search_medication_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_profile_iconButton'),
            icon: const Icon(Icons.account_circle),
            onPressed: () => Navigator.of(context).push<void>(
              ProfilePage.route(),
            ),
          ),
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
      floatingActionButton: FloatingActionButton(
        tooltip: l10n.searchMedicationFieldLabel,
        onPressed: () => Navigator.push<void>(
          context,
          SearchMedicationPage.route(),
        ),
        child: const Icon(Icons.search),
      ),
    );
  }
}
