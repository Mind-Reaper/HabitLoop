import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_habit_page_widget.dart' show AddHabitPageWidget;
import 'package:flutter/material.dart';

class AddHabitPageModel extends FlutterFlowModel<AddHabitPageWidget> {
  ///  Local state fields for this page.

  List<WeekDay> selectedWeekDays = [];
  void addToSelectedWeekDays(WeekDay item) => selectedWeekDays.add(item);
  void removeFromSelectedWeekDays(WeekDay item) =>
      selectedWeekDays.remove(item);
  void removeAtIndexFromSelectedWeekDays(int index) =>
      selectedWeekDays.removeAt(index);
  void insertAtIndexInSelectedWeekDays(int index, WeekDay item) =>
      selectedWeekDays.insert(index, item);
  void updateSelectedWeekDaysAtIndex(int index, Function(WeekDay) updateFn) =>
      selectedWeekDays[index] = updateFn(selectedWeekDays[index]);

  DocumentReference? selectedIcon;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Type habit name is required';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Describe a habit is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }

    return null;
  }

  // State field(s) for CheckboxListTile widget.
  Map<WeekDay, bool> checkboxListTileValueMap = {};
  List<WeekDay> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
