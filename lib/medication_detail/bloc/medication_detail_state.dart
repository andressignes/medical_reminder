part of 'medication_detail_bloc.dart';

abstract class MedicationDetailState extends Equatable {
  const MedicationDetailState();
}

class MedicationDetailStateInitial extends MedicationDetailState {
  @override
  List<Object> get props => [];
}

class MedicationDetailStateLoading extends MedicationDetailState {
  @override
  List<Object> get props => [];
}

class MedicationDetailStateLoaded extends MedicationDetailState {
  const MedicationDetailStateLoaded({required this.medication});

  final Medicamento medication;

  @override
  List<Object> get props => [medication];
}

class MedicationDetailStateLoadedError extends MedicationDetailState {
  @override
  List<Object> get props => [];
}
