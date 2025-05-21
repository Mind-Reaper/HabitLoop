import '/backend/schema/structs/index.dart';
import '/components/calendar_date_box_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - fetchUserById] action in HomePage widget.
  UserStruct? user;
  // Models for CalendarDateBox dynamic component.
  late FlutterFlowDynamicModels<CalendarDateBoxModel> calendarDateBoxModels;

  @override
  void initState(BuildContext context) {
    calendarDateBoxModels =
        FlutterFlowDynamicModels(() => CalendarDateBoxModel());
  }

  @override
  void dispose() {
    calendarDateBoxModels.dispose();
  }
}
