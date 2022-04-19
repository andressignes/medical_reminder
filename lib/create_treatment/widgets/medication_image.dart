import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/create_treatment/cubit/create_treatment_cubit.dart';
import 'package:medical_reminder/medication_detail/widgets/image_fullscreen_page.dart';

class MedicationImage extends StatelessWidget {
  const MedicationImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTreatmentCubit, CreateTreatmentState>(
      builder: (context, state) {
        final noImage = Image.asset('assets/images/no_image.png');
        if (state.medication.value?.fotoMaterialAS?.url == null) return noImage;
        final urlPhoto = state.medication.value!.fotoMaterialAS!.urlFull!;
        return Image.network(
          urlPhoto,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            return loadingProgress == null
                ? child
                : const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
