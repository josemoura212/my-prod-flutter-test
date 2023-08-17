import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Owner {
  String login;
  Owner({
    required this.login,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
    };
  }

  factory Owner.fromMap(Map<String, dynamic> map) {
    return Owner(
      login: map['login'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Owner.fromJson(String source) => Owner.fromMap(json.decode(source) as Map<String, dynamic>);
}
