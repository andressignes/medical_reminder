import 'package:flutter/widgets.dart';
import 'package:medical_reminder/app/bloc/app_bloc.dart';
import 'package:medical_reminder/home/home.dart';
import 'package:medical_reminder/login/login.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [
        HomePage.page(),
      ];
    case AppStatus.unauthenticated:
      return [
        LoginPage.page(),
      ];
  }
}
