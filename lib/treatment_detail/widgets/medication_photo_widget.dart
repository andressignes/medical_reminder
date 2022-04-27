import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';

class MedicationPhotoWidget extends StatelessWidget {
  const MedicationPhotoWidget({
    Key? key,
    required this.fotos,
  }) : super(key: key);
  final List<Foto>? fotos;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (fotos == null || fotos!.isEmpty) {
      return Image.asset('assets/images/no_image.png');
    }

    final urlPhoto = fotos!
            .firstWhere(
              (foto) =>
                  foto.tipo == FotoType.materialAcondicionamentoSecundario,
            )
            .urlFull ??
        '';

    return SizedBox(
      height: size.height * 0.3,
      width: double.infinity,
      child: Hero(
        tag: urlPhoto,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width * 0.01),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              urlPhoto,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                return loadingProgress == null
                    ? child
                    : const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
