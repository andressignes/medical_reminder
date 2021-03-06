import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/medication_detail/widgets/image_fullscreen_page.dart';

class MedicationPhotoWidget extends StatelessWidget {
  const MedicationPhotoWidget({
    Key? key,
    required this.fotos,
  }) : super(key: key);
  final List<Foto>? fotos;

  @override
  Widget build(BuildContext context) {
    if (fotos == null || fotos!.isEmpty) {
      return Image.asset('assets/images/no_image.png');
    }
    final urlPhoto = fotos!
            .firstWhere(
              (foto) =>
                  foto.tipo == FotoType.materialAcondicionamentoSecundario,
            )
            .url ??
        '';

    return SizedBox(
      height: 150,
      width: double.infinity,
      child: fotos?.isEmpty ?? true
          ? Image.asset('assets/images/no_image.png')
          : InkWell(
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
                  urlPhoto.replaceAll('thumbnails', 'full'),
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    return loadingProgress == null
                        ? child
                        : const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
    );
  }
}
