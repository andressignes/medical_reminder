import 'package:flutter/material.dart';
import 'package:medical_reminder/treatment_detail/treatment_detail.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:treatment_repository/treatment_repository.dart';

class DosesListView extends StatefulWidget {
  const DosesListView({
    Key? key,
    required this.doses,
    required this.treatmentId,
  }) : super(key: key);

  final List<Dose> doses;
  final String treatmentId;

  @override
  State<DosesListView> createState() => _DosesListViewState();
}

class _DosesListViewState extends State<DosesListView> {
  final itemScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();
  bool reversed = false;
  double alignment = 0;

  @override
  Widget build(BuildContext context) {
    var index = 0;
    for (final item in widget.doses) {
      if (item.scheduledDateTime.isBefore(DateTime.now())) {
        index++;
      }
    }
    return SizedBox(
      height: 150,
      child: ScrollablePositionedList.builder(
        itemCount: widget.doses.length,
        itemScrollController: itemScrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => DoseItemList(
          dose: widget.doses.elementAt(index),
          treatmentId: widget.treatmentId,
        ),
        itemPositionsListener: itemPositionsListener,
        initialScrollIndex: index,
      ),
    );
  }
}
