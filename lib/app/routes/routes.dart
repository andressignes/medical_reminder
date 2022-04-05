import 'package:flutter/widgets.dart';
import 'package:medicalreminder/app/bloc/app_bloc.dart';
import 'package:medicalreminder/home/home.dart';
import 'package:medicalreminder/login/login.dart';

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
