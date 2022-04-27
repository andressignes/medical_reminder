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
              (photo) =>
                  photo.tipo == FotoType.formaFarmaceutica,
            ) ==
            -1) {
      return Image.asset('assets/images/no_image.png');
    }
    final urlPhoto = photos!
        .firstWhere(
          (photo) => photo.tipo == FotoType.formaFarmaceutica,
        )
        .urlThumbnails!;

    return Hero(
      tag: urlPhoto,
      child: Image.network(
        urlPhoto,
        loadingBuilder: (context, child, loadingProgress) =>
            loadingProgress == null
                ? child
                : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
