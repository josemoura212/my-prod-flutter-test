// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../../../models/profile_model.dart';
import '../../../models/repos_model.dart';
import '../../../models/starred_model.dart';

class ProfileRepository {
  Future<ProfileModel> getProfile(String name) async {
    final response = await Dio().get("https://api.github.com/users/$name");

    if (response.data["message"] == "Not Found") {
      throw Exception("Usuario nao encontrado");
    }

    final repos = await getRepos(name);
    final starred = await getStarred(name);

    return ProfileModel.fromMap(
      response.data,
      reposList: repos,
      starredList: starred,
    );
  }

  Future<List<ReposModel>> getRepos(String name) async {
    final response = await Dio().get("https://api.github.com/users/$name/repos?per_page=200");
    if (response.data is Map) {
      if (response.data["message"] == "Not Found") {
        throw Exception("Repos nao encontrado");
      }
    }
    return List<ReposModel>.from(response.data.map((respo) {
      return ReposModel.fromMap(respo);
    }));
  }

  Future<List<StarredModel>> getStarred(String name) async {
    final response = await Dio().get("https://api.github.com/users/$name/starred?per_page=200");
    if (response.data is Map) {
      if (response.data["message"] == "Not Found") {
        throw Exception("Starred nao encontrado");
      }
    }
    return List<StarredModel>.from(response.data.map((starred) {
      return StarredModel.fromMap(starred);
    }));
  }
}
