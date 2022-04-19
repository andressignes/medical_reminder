import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/medication_search/medication_search.dart';
import 'package:medical_reminder/medication_search/widgets/search_medication_delegate.dart';

class SearchMedicalView extends StatelessWidget {
  const SearchMedicalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: TextFormField(
        //   decoration: InputDecoration(
        //     hintText: l10n.searchMedicationFieldLabel,
        //   ),
        //   onChanged: (text) {
        //     if (text.length > 3) {
        //       context
        //           .read<MedicationSearchBloc>()
        //           .add(MedicationsFetched(name: text));
        //     }
        //   },
        // ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch<Medicamento?>(
              context: context,
              delegate: SearchMedicationDelegate(
                context.read<MedicationSearchBloc>(),
              ),
            ),
          ),
        ],
      ),
      body: const SearchMedicationResultList(),
    );
  }
}
