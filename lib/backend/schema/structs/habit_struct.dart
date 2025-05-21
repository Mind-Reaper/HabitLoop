// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HabitStruct extends FFFirebaseStruct {
  HabitStruct({
    String? id,
    String? name,
    String? description,
    Color? color,
    List<WeekDay>? weekDays,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _description = description,
        _color = color,
        _weekDays = weekDays,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "weekDays" field.
  List<WeekDay>? _weekDays;
  List<WeekDay> get weekDays => _weekDays ?? const [];
  set weekDays(List<WeekDay>? val) => _weekDays = val;

  void updateWeekDays(Function(List<WeekDay>) updateFn) {
    updateFn(_weekDays ??= []);
  }

  bool hasWeekDays() => _weekDays != null;

  static HabitStruct fromMap(Map<String, dynamic> data) => HabitStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        color: getSchemaColor(data['color']),
        weekDays: getEnumList<WeekDay>(data['weekDays']),
      );

  static HabitStruct? maybeFromMap(dynamic data) =>
      data is Map ? HabitStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'description': _description,
        'color': _color,
        'weekDays': _weekDays?.map((e) => e.serialize()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'weekDays': serializeParam(
          _weekDays,
          ParamType.Enum,
          isList: true,
        ),
      }.withoutNulls;

  static HabitStruct fromSerializableMap(Map<String, dynamic> data) =>
      HabitStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        weekDays: deserializeParam<WeekDay>(
          data['weekDays'],
          ParamType.Enum,
          true,
        ),
      );

  @override
  String toString() => 'HabitStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HabitStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        color == other.color &&
        listEquality.equals(weekDays, other.weekDays);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, description, color, weekDays]);
}

HabitStruct createHabitStruct({
  String? id,
  String? name,
  String? description,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HabitStruct(
      id: id,
      name: name,
      description: description,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HabitStruct? updateHabitStruct(
  HabitStruct? habit, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    habit
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHabitStructData(
  Map<String, dynamic> firestoreData,
  HabitStruct? habit,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (habit == null) {
    return;
  }
  if (habit.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && habit.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final habitData = getHabitFirestoreData(habit, forFieldValue);
  final nestedData = habitData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = habit.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHabitFirestoreData(
  HabitStruct? habit, [
  bool forFieldValue = false,
]) {
  if (habit == null) {
    return {};
  }
  final firestoreData = mapToFirestore(habit.toMap());

  // Add any Firestore field values
  habit.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHabitListFirestoreData(
  List<HabitStruct>? habits,
) =>
    habits?.map((e) => getHabitFirestoreData(e, true)).toList() ?? [];
