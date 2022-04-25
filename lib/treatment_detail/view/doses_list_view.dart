import 'package:dose_repository/dose_repository.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/treatment_detail/treatment_detail.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DosesListView extends StatefulWidget {
  const DosesListView({
    Key? key,
    required this.doses,
  }) : super(key: key);

  final List<Dose> doses;

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
    return ScrollablePositionedList.builder(
      itemCount: widget.doses.length,
      itemScrollController: itemScrollController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) =>
          DoseItemList(dose: widget.doses.elementAt(index)),
      itemPositionsListener: itemPositionsListener,
    );
  }
}
