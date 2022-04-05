// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:authentication_repository/authentication_repository.dart';
import 'package:medicalreminder/app/app.dart';
import 'package:medicalreminder/bootstrap.dart';

void main() {
  bootstrap(
    () => App(
      authenticationRepository: AuthenticationRepository(),
    ),
  );
}
