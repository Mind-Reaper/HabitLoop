// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CompletedHabitStruct extends FFFirebaseStruct {
  CompletedHabitStruct({
    String? id,
    DateTime? completedAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _completedAt = completedAt,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "completedAt" field.
  DateTime? _completedAt;
  DateTime? get completedAt => _completedAt;
  set completedAt(DateTime? val) => _completedAt = val;

  bool hasCompletedAt() => _completedAt != null;

  static CompletedHabitStruct fromMap(Map<String, dynamic> data) =>
      CompletedHabitStruct(
        id: data['id'] as String?,
        completedAt: data['completedAt'] as DateTime?,
      );

  static CompletedHabitStruct? maybeFromMap(dynamic data) => data is Map
      ? CompletedHabitStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'completedAt': _completedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'completedAt': serializeParam(
          _completedAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static CompletedHabitStruct fromSerializableMap(Map<String, dynamic> data) =>
      CompletedHabitStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        completedAt: deserializeParam(
          data['completedAt'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'CompletedHabitStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CompletedHabitStruct &&
        id == other.id &&
        completedAt == other.completedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([id, completedAt]);
}

CompletedHabitStruct createCompletedHabitStruct({
  String? id,
  DateTime? completedAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompletedHabitStruct(
      id: id,
      completedAt: completedAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CompletedHabitStruct? updateCompletedHabitStruct(
  CompletedHabitStruct? completedHabit, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    completedHabit
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCompletedHabitStructData(
  Map<String, dynamic> firestoreData,
  CompletedHabitStruct? completedHabit,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (completedHabit == null) {
    return;
  }
  if (completedHabit.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && completedHabit.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final completedHabitData =
      getCompletedHabitFirestoreData(completedHabit, forFieldValue);
  final nestedData =
      completedHabitData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = completedHabit.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCompletedHabitFirestoreData(
  CompletedHabitStruct? completedHabit, [
  bool forFieldValue = false,
]) {
  if (completedHabit == null) {
    return {};
  }
  final firestoreData = mapToFirestore(completedHabit.toMap());

  // Add any Firestore field values
  completedHabit.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompletedHabitListFirestoreData(
  List<CompletedHabitStruct>? completedHabits,
) =>
    completedHabits
        ?.map((e) => getCompletedHabitFirestoreData(e, true))
        .toList() ??
    [];
