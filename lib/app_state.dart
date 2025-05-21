import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_currentUser')) {
        try {
          final serializedData = prefs.getString('ff_currentUser') ?? '{}';
          _currentUser =
              UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _selectedDate = prefs.containsKey('ff_selectedDate')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_selectedDate')!)
          : _selectedDate;
    });
    _safeInit(() {
      _calendarDates = prefs
              .getStringList('ff_calendarDates')
              ?.map((x) => DateTime.fromMillisecondsSinceEpoch(int.parse(x)))
              .toList() ??
          _calendarDates;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserStruct _currentUser = UserStruct.fromSerializableMap(
      jsonDecode('{\"email\":\"...\",\"username\":\"...\",\"uid\":\"...\"}'));
  UserStruct get currentUser => _currentUser;
  set currentUser(UserStruct value) {
    _currentUser = value;
    prefs.setString('ff_currentUser', value.serialize());
  }

  void updateCurrentUserStruct(Function(UserStruct) updateFn) {
    updateFn(_currentUser);
    prefs.setString('ff_currentUser', _currentUser.serialize());
  }

  DateTime? _selectedDate = DateTime.fromMillisecondsSinceEpoch(1747841520000);
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
    value != null
        ? prefs.setInt('ff_selectedDate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_selectedDate');
  }

  List<DateTime> _calendarDates = [];
  List<DateTime> get calendarDates => _calendarDates;
  set calendarDates(List<DateTime> value) {
    _calendarDates = value;
    prefs.setStringList('ff_calendarDates',
        value.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void addToCalendarDates(DateTime value) {
    calendarDates.add(value);
    prefs.setStringList(
        'ff_calendarDates',
        _calendarDates
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  void removeFromCalendarDates(DateTime value) {
    calendarDates.remove(value);
    prefs.setStringList(
        'ff_calendarDates',
        _calendarDates
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  void removeAtIndexFromCalendarDates(int index) {
    calendarDates.removeAt(index);
    prefs.setStringList(
        'ff_calendarDates',
        _calendarDates
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  void updateCalendarDatesAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    calendarDates[index] = updateFn(_calendarDates[index]);
    prefs.setStringList(
        'ff_calendarDates',
        _calendarDates
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  void insertAtIndexInCalendarDates(int index, DateTime value) {
    calendarDates.insert(index, value);
    prefs.setStringList(
        'ff_calendarDates',
        _calendarDates
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
