import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/medication_search/medication_search.dart';

class SearchMedicalView extends StatelessWidget {
  const SearchMedicalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onChanged: (text) {
            if (text.length > 3) {
              context
                  .read<MedicationSearchBloc>()
                  .add(MedicationsFetched(name: text));
            }
          },
        ),
      ),
      body: const SearchMedicationResultList(),
    );
  }
}
