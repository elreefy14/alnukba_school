// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Payment {
  String id;
  double amount;
  String clientId;
  DateTime dateTime;
  Payment(
      {required this.id,
      required this.amount,
      required this.dateTime,
      required this.clientId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'clientId': clientId,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      id: map['id'] as String,
      clientId: map['clientId'] as String,
      amount: double.parse(map['amount'].toString()),
      dateTime: DateTime.fromMillisecondsSinceEpoch(
         // map['dateTime'].millisecondsSinceEpoch),
         //todo: fix this
         ////////////////////////////////////////////
          map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source) as Map<String, dynamic>);
}
