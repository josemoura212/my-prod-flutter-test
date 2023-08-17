// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'repos_model.dart';
import 'starred_model.dart';

class ProfileModel {
  String? name;
  String? bio;
  String? avatar_url;
  List<ReposModel>? repos;
  List<StarredModel>? starred;
  ProfileModel({
    this.name,
    this.bio,
    this.avatar_url,
    this.repos,
    this.starred,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'bio': bio,
      'avatar_url': avatar_url,
      'repos': repos?.map((x) => x.toMap()).toList(),
      'starred': starred?.map((x) => x.toMap()).toList(),
    };
  }

  factory ProfileModel.fromMap(
    Map<String, dynamic> map, {
    required List<ReposModel> reposList,
    required List<StarredModel> starredList,
  }) {
    return ProfileModel(
      name: map['name'] != null ? map['name'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
      avatar_url: map['avatar_url'] != null ? map['avatar_url'] as String : null,
      repos: reposList,
      starred: starredList,
    );
  }

  String toJson() => json.encode(toMap());
}
