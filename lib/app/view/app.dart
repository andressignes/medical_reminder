// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:dose_repository/dose_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medical_reminder/app/app.dart';
import 'package:medical_reminder/create_treatment/bloc/create_treatment_bloc.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/medication_search/bloc/medication_search_bloc.dart';
import 'package:medical_reminder/treatment_schedule/bloc/treatment_schedule_bloc.dart';
import 'package:treatment_repository/treatment_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
          create: (_) => authenticationRepository,
        ),
        RepositoryProvider(
          create: (_) => CimaRepository(
            remoteDataSource: CimaApiClient(),
          ),
        ),
        RepositoryProvider(create: (_) => TreatmentRepository()),
        RepositoryProvider(create: (_) => DoseRepository()),
      ],
      child: BlocProvider<AppBloc>(
        create: (context) => AppBloc(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MedicationSearchBloc(
            cimaRepository: context.read<CimaRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => CreateTreatmentBloc(
            userId: context.read<AppBloc>().state.user.id,
            treatmentRepository: context.read<TreatmentRepository>(),
            doseRepository: context.read<DoseRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => TreatmentScheduleBloc(
            userId: context.read<AppBloc>().state.user.id,
            treatmentRepository: context.read<TreatmentRepository>(),
            doseRepository: context.read<DoseRepository>(),
            cimaRepository: context.read<CimaRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: FlowBuilder<AppStatus>(
          state: context.select((AppBloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppViewPages,
        ),
      ),
    );
  }
}
