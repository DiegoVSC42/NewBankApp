// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Card {
  final String? embossing;
  final String? cardNumber;
  final DateTime expireDate;
  final String? cvv;

  Card(this.embossing, this.cardNumber, this.expireDate, this.cvv);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'embossing': embossing,
      'cardNumber': cardNumber,
      'expireDate': expireDate.millisecondsSinceEpoch,
      'cvv': cvv,
    };
  }

  factory Card.fromMap(Map<String, dynamic> map) {
    return Card(
      map['embossing'] != null ? map['embossing'] as String : null,
      map['cardNumber'] != null ? map['cardNumber'] as String : null,
      DateTime.fromMillisecondsSinceEpoch(map['expireDate'] as int),
      map['cvv'] != null ? map['cvv'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Card.fromJson(String source) =>
      Card.fromMap(json.decode(source) as Map<String, dynamic>);
}
