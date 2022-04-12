import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalreminder/app/bloc/app_bloc.dart';
import 'package:medicalreminder/profile/cubit/profile_cubit.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        final name = context.read<AppBloc>().state.user.name ?? '';
        return Center(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://ui-avatars.com/api/?background=random&name=$name',
            ),
            radius: size.width * 0.15,
          ),
        );
      },
    );
  }
}
