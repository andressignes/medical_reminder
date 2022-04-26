import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/create_treatment/view/create_treatment_page.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/profile/view/profile_page.dart';
import 'package:medical_reminder/treatment_schedule/treatment_schedule.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    context
        .read<TreatmentScheduleBloc>()
        .add(const TreatmentScheduleSubscriptionRequested());
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.medicalReminderAppBarTitle),
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
      body: const TreatmentSchedulePage(),
      floatingActionButton: FloatingActionButton(
        tooltip: l10n.searchMedicationFieldLabel,
        onPressed: () => Navigator.push<void>(
          context,
          CreateTreatmentPage.route(),
        ),
        child: const Icon(Icons.medication),
      ),
    );
  }
}
