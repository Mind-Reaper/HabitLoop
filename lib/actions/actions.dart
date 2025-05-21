import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';

Future init(BuildContext context) async {
  await actions.generateCurrentWeekDates();
}
