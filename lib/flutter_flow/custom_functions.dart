import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

bool isSameDate(
  DateTime a,
  DateTime b,
) {
  return a.day == b.day && a.month == b.month && a.year == b.year;
}

bool pastDate(DateTime date) {
  final now = DateTime.now();

  final today = DateTime(now.year, now.month, now.day);

  return date.isBefore(today);
}

DateTime currentDay() {
  final now = DateTime.now();
  final day = DateTime(now.year, now.month, now.day);
  return day;
}

WeekDay weekDayFromDate(DateTime date) {
  final weekday = DateFormat("EEEE").format(date).toLowerCase();
  return WeekDay.values.byName(weekday);
}

IconsRecord? iconFromHabit(
  List<IconsRecord> icons,
  HabitsRecord habit,
) {
  final icon = icons.firstWhere((e) => e.reference.id == habit.reference.id);
  return icon;
}

DateTime dayFromDateTIme(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}
