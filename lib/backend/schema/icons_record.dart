import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IconsRecord extends FirestoreRecord {
  IconsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  void _initializeFields() {
    _icon = snapshotData['icon'] as String?;
    _name = snapshotData['name'] as String?;
    _color = getSchemaColor(snapshotData['color']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('icons');

  static Stream<IconsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IconsRecord.fromSnapshot(s));

  static Future<IconsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IconsRecord.fromSnapshot(s));

  static IconsRecord fromSnapshot(DocumentSnapshot snapshot) => IconsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IconsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IconsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IconsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IconsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIconsRecordData({
  String? icon,
  String? name,
  Color? color,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'icon': icon,
      'name': name,
      'color': color,
    }.withoutNulls,
  );

  return firestoreData;
}

class IconsRecordDocumentEquality implements Equality<IconsRecord> {
  const IconsRecordDocumentEquality();

  @override
  bool equals(IconsRecord? e1, IconsRecord? e2) {
    return e1?.icon == e2?.icon &&
        e1?.name == e2?.name &&
        e1?.color == e2?.color;
  }

  @override
  int hash(IconsRecord? e) =>
      const ListEquality().hash([e?.icon, e?.name, e?.color]);

  @override
  bool isValidKey(Object? o) => o is IconsRecord;
}
