// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> generateCurrentWeekDates() async {
  final today = DateTime.now();
  final int currentWeekday = today.weekday; // Monday = 1, Sunday = 7

  // Calculate how many days to subtract to get to Monday
  final monday = today.subtract(Duration(days: currentWeekday - 1));

  // Generate 7 days starting from Monday
  final dates = List.generate(7, (index) => monday.add(Duration(days: index)));

  FFAppState().calendarDates = dates;
}
