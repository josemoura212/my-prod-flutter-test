// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'owner.dart';

class StarredModel {
  String? name;
  Owner? owner;
  String? description;
  int? stargazers_count;
  int? forks_count;
  StarredModel({
    this.name,
    this.owner,
    this.description,
    this.stargazers_count,
    this.forks_count,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'owner': owner?.toMap(),
      'description': description,
      'stargazers_count': stargazers_count,
      'forks_count': forks_count,
    };
  }

  factory StarredModel.fromMap(Map<String, dynamic> map) {
    return StarredModel(
      name: map['name'] != null ? map['name'] as String : null,
      owner: map['owner'] != null ? Owner.fromMap(map['owner'] as Map<String, dynamic>) : null,
      description: map['description'] != null ? map['description'] as String : null,
      stargazers_count: map['stargazers_count'] != null ? map['stargazers_count'] as int : null,
      forks_count: map['forks_count'] != null ? map['forks_count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StarredModel.fromJson(String source) => StarredModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
