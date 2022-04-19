import 'package:cima_model/cima_model.dart' show Foto;
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/medication_detail/widgets/widgets.dart';

class PharmaceuticalFormPhotoWidget extends StatelessWidget {
  const PharmaceuticalFormPhotoWidget({
    Key? key,
    required this.fotos,
  }) : super(key: key);

  final List<Foto>? fotos;

  @override
  Widget build(BuildContext context) {
    if (fotos == null ||
        fotos!.isEmpty ||
        fotos!.indexWhere(
              (element) => element.tipo == FotoType.formaFarmaceutica,
            ) ==
            -1) {
      return Image.asset('assets/images/no_image.png');
    }
    final urlPhoto = fotos!
            .firstWhere(
              (foto) => foto.tipo == FotoType.formaFarmaceutica,
            )
            .url ??
        '';
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => ImageFullscreenPage(
            imageLink: urlPhoto,
          ),
        ),
      ),
      child: Hero(
        tag: urlPhoto,
        child: Image.network(
          urlPhoto,
          fit: BoxFit.fitWidth,
          // loadingBuilder: (context, child, loadingProgress) {
          //   return loadingProgress == null
          //       ? child
          //       : const Center(child: CircularProgressIndicator());
          // },
        ),
      ),
    );
  }
}
