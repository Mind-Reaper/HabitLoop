import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompletedHabitsRecord extends FirestoreRecord {
  CompletedHabitsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "habitId" field.
  String? _habitId;
  String get habitId => _habitId ?? '';
  bool hasHabitId() => _habitId != null;

  // "completedAt" field.
  DateTime? _completedAt;
  DateTime? get completedAt => _completedAt;
  bool hasCompletedAt() => _completedAt != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _habitId = snapshotData['habitId'] as String?;
    _completedAt = snapshotData['completedAt'] as DateTime?;
    _userId = snapshotData['userId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('completed_habits');

  static Stream<CompletedHabitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompletedHabitsRecord.fromSnapshot(s));

  static Future<CompletedHabitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompletedHabitsRecord.fromSnapshot(s));

  static CompletedHabitsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompletedHabitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompletedHabitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompletedHabitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompletedHabitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompletedHabitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompletedHabitsRecordData({
  String? habitId,
  DateTime? completedAt,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'habitId': habitId,
      'completedAt': completedAt,
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompletedHabitsRecordDocumentEquality
    implements Equality<CompletedHabitsRecord> {
  const CompletedHabitsRecordDocumentEquality();

  @override
  bool equals(CompletedHabitsRecord? e1, CompletedHabitsRecord? e2) {
    return e1?.habitId == e2?.habitId &&
        e1?.completedAt == e2?.completedAt &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(CompletedHabitsRecord? e) =>
      const ListEquality().hash([e?.habitId, e?.completedAt, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is CompletedHabitsRecord;
}
