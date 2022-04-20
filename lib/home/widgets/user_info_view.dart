import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/app/bloc/app_bloc.dart';

class UserInfoview extends StatelessWidget {
  const UserInfoview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('id: ${user.id}'),
          Text('Email: ${user.email}'),
          Text('Name: ${user.name}'),
          Text('Gender ${user.gender.toString()}'),
          Text('Birth: ${user.birthDate.toString()}'),
        ],
      ),
    );
  }
}
