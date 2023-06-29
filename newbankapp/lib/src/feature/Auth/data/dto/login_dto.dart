import 'dart:convert';

class LoginDto {
  final String? cpf;
  final String? password;

  LoginDto(this.cpf, this.password);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cpf': cpf,
      'password': password,
    };
  }

  factory LoginDto.fromMap(Map<String, dynamic> map) {
    return LoginDto(
      map['cpf'] != null ? map['cpf'] as String : null,
      map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginDto.fromJson(String source) =>
      LoginDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
