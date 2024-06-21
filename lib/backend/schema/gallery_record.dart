import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GalleryRecord extends FirestoreRecord {
  GalleryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "createDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _photo = snapshotData['photo'] as String?;
    _createDate = snapshotData['createDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gallery');

  static Stream<GalleryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GalleryRecord.fromSnapshot(s));

  static Future<GalleryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GalleryRecord.fromSnapshot(s));

  static GalleryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GalleryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GalleryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GalleryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GalleryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GalleryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGalleryRecordData({
  String? description,
  String? photo,
  DateTime? createDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'photo': photo,
      'createDate': createDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class GalleryRecordDocumentEquality implements Equality<GalleryRecord> {
  const GalleryRecordDocumentEquality();

  @override
  bool equals(GalleryRecord? e1, GalleryRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.photo == e2?.photo &&
        e1?.createDate == e2?.createDate;
  }

  @override
  int hash(GalleryRecord? e) =>
      const ListEquality().hash([e?.description, e?.photo, e?.createDate]);

  @override
  bool isValidKey(Object? o) => o is GalleryRecord;
}
