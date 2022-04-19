import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/medication_search/medication_search.dart';
import 'package:medical_reminder/medication_search/widgets/search_medication_delegate.dart';

class SearchMedicationResultList extends StatelessWidget {
  const SearchMedicationResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<MedicationSearchBloc, MedicationSearchState>(
      listener: (context, state) {
        if (state.status == MedicationSearchStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.errorSearchMedicationMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case MedicationSearchStatus.initial:
          case MedicationSearchStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case MedicationSearchStatus.loaded:
          case MedicationSearchStatus.error:
            return ListView.builder(
              itemCount: state.medications.length,
              itemBuilder: (context, index) {
                final medication = state.medications[index];
                return MedicationSearchItemResultList(medication: medication);
              },
            );
        }
      },
    );
  }
}
