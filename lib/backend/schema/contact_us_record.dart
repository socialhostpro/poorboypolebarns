import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactUsRecord extends FirestoreRecord {
  ContactUsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "createDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "adminNotes" field.
  String? _adminNotes;
  String get adminNotes => _adminNotes ?? '';
  bool hasAdminNotes() => _adminNotes != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "typOfConstruct" field.
  String? _typOfConstruct;
  String get typOfConstruct => _typOfConstruct ?? '';
  bool hasTypOfConstruct() => _typOfConstruct != null;

  // "barnSize" field.
  String? _barnSize;
  String get barnSize => _barnSize ?? '';
  bool hasBarnSize() => _barnSize != null;

  // "locationSDescription" field.
  String? _locationSDescription;
  String get locationSDescription => _locationSDescription ?? '';
  bool hasLocationSDescription() => _locationSDescription != null;

  // "locationStreet" field.
  String? _locationStreet;
  String get locationStreet => _locationStreet ?? '';
  bool hasLocationStreet() => _locationStreet != null;

  // "locationCity" field.
  String? _locationCity;
  String get locationCity => _locationCity ?? '';
  bool hasLocationCity() => _locationCity != null;

  // "locationZip" field.
  int? _locationZip;
  int get locationZip => _locationZip ?? 0;
  bool hasLocationZip() => _locationZip != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _phone = snapshotData['phone'] as String?;
    _email = snapshotData['email'] as String?;
    _message = snapshotData['message'] as String?;
    _createDate = snapshotData['createDate'] as DateTime?;
    _adminNotes = snapshotData['adminNotes'] as String?;
    _status = snapshotData['status'] as bool?;
    _typOfConstruct = snapshotData['typOfConstruct'] as String?;
    _barnSize = snapshotData['barnSize'] as String?;
    _locationSDescription = snapshotData['locationSDescription'] as String?;
    _locationStreet = snapshotData['locationStreet'] as String?;
    _locationCity = snapshotData['locationCity'] as String?;
    _locationZip = castToType<int>(snapshotData['locationZip']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contactUs');

  static Stream<ContactUsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContactUsRecord.fromSnapshot(s));

  static Future<ContactUsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContactUsRecord.fromSnapshot(s));

  static ContactUsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContactUsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContactUsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContactUsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContactUsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContactUsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContactUsRecordData({
  String? name,
  String? phone,
  String? email,
  String? message,
  DateTime? createDate,
  String? adminNotes,
  bool? status,
  String? typOfConstruct,
  String? barnSize,
  String? locationSDescription,
  String? locationStreet,
  String? locationCity,
  int? locationZip,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'phone': phone,
      'email': email,
      'message': message,
      'createDate': createDate,
      'adminNotes': adminNotes,
      'status': status,
      'typOfConstruct': typOfConstruct,
      'barnSize': barnSize,
      'locationSDescription': locationSDescription,
      'locationStreet': locationStreet,
      'locationCity': locationCity,
      'locationZip': locationZip,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContactUsRecordDocumentEquality implements Equality<ContactUsRecord> {
  const ContactUsRecordDocumentEquality();

  @override
  bool equals(ContactUsRecord? e1, ContactUsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.phone == e2?.phone &&
        e1?.email == e2?.email &&
        e1?.message == e2?.message &&
        e1?.createDate == e2?.createDate &&
        e1?.adminNotes == e2?.adminNotes &&
        e1?.status == e2?.status &&
        e1?.typOfConstruct == e2?.typOfConstruct &&
        e1?.barnSize == e2?.barnSize &&
        e1?.locationSDescription == e2?.locationSDescription &&
        e1?.locationStreet == e2?.locationStreet &&
        e1?.locationCity == e2?.locationCity &&
        e1?.locationZip == e2?.locationZip;
  }

  @override
  int hash(ContactUsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.phone,
        e?.email,
        e?.message,
        e?.createDate,
        e?.adminNotes,
        e?.status,
        e?.typOfConstruct,
        e?.barnSize,
        e?.locationSDescription,
        e?.locationStreet,
        e?.locationCity,
        e?.locationZip
      ]);

  @override
  bool isValidKey(Object? o) => o is ContactUsRecord;
}
