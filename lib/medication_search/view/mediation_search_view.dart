import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/medication_search/medication_search.dart';

class SearchMedicalView extends StatelessWidget {
  const SearchMedicalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: InputDecoration(
            hintText: l10n.searchMedicationFieldLabel,
          ),
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

class _SearchAppBar extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
