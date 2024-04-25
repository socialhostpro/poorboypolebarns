import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class WebSiteContentRecord extends FirestoreRecord {
  WebSiteContentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "createDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "page" field.
  String? _page;
  String get page => _page ?? '';
  bool hasPage() => _page != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _image = snapshotData['image'] as String?;
    _video = snapshotData['video'] as String?;
    _createDate = snapshotData['createDate'] as DateTime?;
    _text = snapshotData['text'] as String?;
    _location = snapshotData['location'] as String?;
    _page = snapshotData['page'] as String?;
    _status = snapshotData['status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('webSiteContent');

  static Stream<WebSiteContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WebSiteContentRecord.fromSnapshot(s));

  static Future<WebSiteContentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WebSiteContentRecord.fromSnapshot(s));

  static WebSiteContentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WebSiteContentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WebSiteContentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WebSiteContentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WebSiteContentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WebSiteContentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWebSiteContentRecordData({
  String? type,
  String? image,
  String? video,
  DateTime? createDate,
  String? text,
  String? location,
  String? page,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'image': image,
      'video': video,
      'createDate': createDate,
      'text': text,
      'location': location,
      'page': page,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class WebSiteContentRecordDocumentEquality
    implements Equality<WebSiteContentRecord> {
  const WebSiteContentRecordDocumentEquality();

  @override
  bool equals(WebSiteContentRecord? e1, WebSiteContentRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.image == e2?.image &&
        e1?.video == e2?.video &&
        e1?.createDate == e2?.createDate &&
        e1?.text == e2?.text &&
        e1?.location == e2?.location &&
        e1?.page == e2?.page &&
        e1?.status == e2?.status;
  }

  @override
  int hash(WebSiteContentRecord? e) => const ListEquality().hash([
        e?.type,
        e?.image,
        e?.video,
        e?.createDate,
        e?.text,
        e?.location,
        e?.page,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is WebSiteContentRecord;
}
