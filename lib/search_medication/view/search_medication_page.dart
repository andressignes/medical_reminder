import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalreminder/l10n/l10n.dart';
import 'package:medicalreminder/search_medication/bloc/search_medication_bloc.dart';
import 'package:medicalreminder/search_medication/view/search_medication_result_list.dart';

class SearchMedicationPage extends StatelessWidget {
  const SearchMedicationPage({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const SearchMedicationPage());

  static Page page() => const MaterialPage<void>(child: SearchMedicationPage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (_) => SearchMedicationBloc(
          cimaRepository: context.read<CimaRepository>(),
        )..add(const MedicationsFetched(name: 'paraceta')),
        child: const SearchMedicationResultList(),
      ),
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
