import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HabitsRecord extends FirestoreRecord {
  HabitsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "intervals" field.
  List<WeekDay>? _intervals;
  List<WeekDay> get intervals => _intervals ?? const [];
  bool hasIntervals() => _intervals != null;

  // "icon" field.
  DocumentReference? _icon;
  DocumentReference? get icon => _icon;
  bool hasIcon() => _icon != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _intervals = getEnumList<WeekDay>(snapshotData['intervals']);
    _icon = snapshotData['icon'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _createdBy = snapshotData['createdBy'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('habits');

  static Stream<HabitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HabitsRecord.fromSnapshot(s));

  static Future<HabitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HabitsRecord.fromSnapshot(s));

  static HabitsRecord fromSnapshot(DocumentSnapshot snapshot) => HabitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HabitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HabitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HabitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HabitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHabitsRecordData({
  String? name,
  String? description,
  DocumentReference? icon,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'icon': icon,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'createdBy': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class HabitsRecordDocumentEquality implements Equality<HabitsRecord> {
  const HabitsRecordDocumentEquality();

  @override
  bool equals(HabitsRecord? e1, HabitsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.intervals, e2?.intervals) &&
        e1?.icon == e2?.icon &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(HabitsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.intervals,
        e?.icon,
        e?.createdAt,
        e?.updatedAt,
        e?.createdBy
      ]);

  @override
  bool isValidKey(Object? o) => o is HabitsRecord;
}
