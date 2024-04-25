import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MailRecord extends FirestoreRecord {
  MailRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "delivery" field.
  String? _delivery;
  String get delivery => _delivery ?? '';
  bool hasDelivery() => _delivery != null;

  // "to" field.
  String? _to;
  String get to => _to ?? '';
  bool hasTo() => _to != null;

  // "message" field.
  MessageStruct? _message;
  MessageStruct get message => _message ?? MessageStruct();
  bool hasMessage() => _message != null;

  // "createDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "customerName" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  void _initializeFields() {
    _delivery = snapshotData['delivery'] as String?;
    _to = snapshotData['to'] as String?;
    _message = MessageStruct.maybeFromMap(snapshotData['message']);
    _createDate = snapshotData['createDate'] as DateTime?;
    _customerName = snapshotData['customerName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mail');

  static Stream<MailRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MailRecord.fromSnapshot(s));

  static Future<MailRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MailRecord.fromSnapshot(s));

  static MailRecord fromSnapshot(DocumentSnapshot snapshot) => MailRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MailRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MailRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MailRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MailRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMailRecordData({
  String? delivery,
  String? to,
  MessageStruct? message,
  DateTime? createDate,
  String? customerName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'delivery': delivery,
      'to': to,
      'message': MessageStruct().toMap(),
      'createDate': createDate,
      'customerName': customerName,
    }.withoutNulls,
  );

  // Handle nested data for "message" field.
  addMessageStructData(firestoreData, message, 'message');

  return firestoreData;
}

class MailRecordDocumentEquality implements Equality<MailRecord> {
  const MailRecordDocumentEquality();

  @override
  bool equals(MailRecord? e1, MailRecord? e2) {
    return e1?.delivery == e2?.delivery &&
        e1?.to == e2?.to &&
        e1?.message == e2?.message &&
        e1?.createDate == e2?.createDate &&
        e1?.customerName == e2?.customerName;
  }

  @override
  int hash(MailRecord? e) => const ListEquality()
      .hash([e?.delivery, e?.to, e?.message, e?.createDate, e?.customerName]);

  @override
  bool isValidKey(Object? o) => o is MailRecord;
}
