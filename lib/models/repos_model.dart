// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'owner.dart';

class ReposModel {
  String? name;
  Owner? owner;
  String? language;
  String? description;
  int? forks_count;
  ReposModel({
    this.name,
    this.owner,
    this.language,
    this.description,
    this.forks_count,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'owner': owner?.toMap(),
      'language': language,
      'description': description,
      'forks_count': forks_count,
    };
  }

  factory ReposModel.fromMap(Map<String, dynamic> map) {
    return ReposModel(
      name: map['name'] != null ? map['name'] as String : null,
      owner: map['owner'] != null ? Owner.fromMap(map['owner'] as Map<String, dynamic>) : null,
      language: map['language'] != null ? map['language'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      forks_count: map['forks_count'] != null ? map['forks_count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReposModel.fromJson(String source) => ReposModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
