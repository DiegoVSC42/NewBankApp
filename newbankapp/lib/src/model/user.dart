import 'dart:convert';

class User {
  int id = 0;
  String firstName = '';
  String lastName = '';
  String cpf = '';
  String userToken = '';
  double? balance;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.cpf,
    required this.userToken,
    this.balance,
  });

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? cpf,
    String? userToken,
    double? balance,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      cpf: cpf ?? this.cpf,
      userToken: userToken ?? this.userToken,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'cpf': cpf,
      'userToken': userToken,
      'balance': balance,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      cpf: map['cpf'] as String,
      userToken: map['userToken'] as String,
      balance: map['balance'] != null ? map['balance'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, cpf: $cpf, userToken: $userToken, balance: $balance)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.cpf == cpf &&
        other.userToken == userToken &&
        other.balance == balance;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        cpf.hashCode ^
        userToken.hashCode ^
        balance.hashCode;
  }
}
