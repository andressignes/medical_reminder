
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalreminder/l10n/l10n.dart';
import 'package:medicalreminder/search_medication/bloc/search_medication_bloc.dart';
import 'package:medicalreminder/search_medication/widgets/search_medication_item_result_list.dart';

class SearchMedicationResultList extends StatelessWidget {
  const SearchMedicationResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<SearchMedicationBloc, SearchMedicationState>(
      listener: (context, state) {
        if (state.status == SearchMedicationStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.errorSearchMedicationMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case SearchMedicationStatus.initial:
          case SearchMedicationStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case SearchMedicationStatus.loaded:
          case SearchMedicationStatus.error:
            return ListView.builder(
              itemCount: state.medications.length,
              itemBuilder: (context, index) {
                final medication = state.medications[index];
                return SearchMedicationItemResultList(medication: medication);
              },
            );
        }
      },
    );
  }
}
