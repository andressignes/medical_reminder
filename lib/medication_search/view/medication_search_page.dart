import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalreminder/l10n/l10n.dart';
import 'package:medicalreminder/medication_search/medication_search.dart';


class MedicationSearchPage extends StatelessWidget {
  const MedicationSearchPage({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const MedicationSearchPage());

  static Page page() => const MaterialPage<void>(child: MedicationSearchPage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (_) => MedicationSearchBloc(
        cimaRepository: context.read<CimaRepository>(),
      ),
      child: const SearchMedicalView(),
    );
  }
}




