import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Dose extends Equatable {
  Dose({
    required this.treatmentId,
    required this.sheduledDateTime,
    this.intakeDateTime,
  }) : id = const Uuid().v4();

  final String id;
  final String treatmentId;
  final DateTime sheduledDateTime;
  final DateTime? intakeDateTime;

  @override
  List<Object?> get props => [
        id,
        treatmentId,
        sheduledDateTime,
        intakeDateTime,
      ];
}
