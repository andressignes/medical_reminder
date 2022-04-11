import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:medicalreminder/l10n/l10n.dart';
import 'package:medicalreminder/profile/cubit/profile_cubit.dart';

class ProfileSaveButton extends StatelessWidget {
  const ProfileSaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('profileForm_save_button'),
                onPressed: state.status.isValidated
                    ? () => context.read<ProfileCubit>().save()
                    : null,
                child: Text(l10n.saveButton),
              );
      },
    );
  }
}
