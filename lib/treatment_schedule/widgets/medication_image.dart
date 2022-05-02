import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';

class MedicationImage extends StatelessWidget {
  const MedicationImage({
    Key? key,
    required this.photos,
  }) : super(key: key);
  final List<Foto>? photos;

  @override
  Widget build(BuildContext context) {
    if (photos == null ||
        photos!.isEmpty ||
        photos!.indexWhere(
              (photo) => photo.tipo == FotoType.formaFarmaceutica,
            ) ==
            -1) {
      return Image.asset('assets/images/no_image.png');
    }
    final urlPhoto = photos!
        .firstWhere(
          (photo) => photo.tipo == FotoType.materialAcondicionamentoSecundario,
        )
        .urlThumbnails!;
    final size = MediaQuery.of(context).size;
    final borderRadius = BorderRadius.circular(8);
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: SizedBox.fromSize(
          size: Size.fromRadius(size.height * 0.04),
          child: Image.network(
            urlPhoto,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
