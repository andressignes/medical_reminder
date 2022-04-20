import 'dart:developer';

import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/medication_search/bloc/medication_search_bloc.dart';
import 'package:medical_reminder/medication_search/widgets/search_medication_delegate.dart';

class AddMedicationButton extends StatelessWidget {
  const AddMedicationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ElevatedButton(
      onPressed: () => showSearch<Medicamento?>(
        context: context,
        delegate: SearchMedicationDelegate(
          context.read<MedicationSearchBloc>(),
        ),
      ),
      child: Text(l10n.addMedicationButton),
    );
  }
}
