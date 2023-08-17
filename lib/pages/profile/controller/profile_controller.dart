import 'package:get/get.dart';

import '../../../models/profile_model.dart';
import '../../../models/repos_model.dart';
import '../../../models/starred_model.dart';
import '../repository/profile_repository.dart';

class ProfileController extends GetxController {
  ProfileModel profileModel = ProfileModel();
  final profileRepository = ProfileRepository();
  RxBool isLoading = false.obs;
  RxBool error = false.obs;
  RxInt index = 0.obs;
  RxList<ReposModel> reposList = <ReposModel>[].obs;
  RxList<StarredModel> starredList = <StarredModel>[].obs;

  void runFilterRepos(String enteredKeyword) {
    List<ReposModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = profileModel.repos!;
      update();
    } else {
      results = profileModel.repos!.where((repos) => repos.name!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      update();
    }

    reposList.value = results;
    update();
  }

  void runFilterStarred(String enteredKeyword) {
    List<StarredModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = profileModel.starred!;
      update();
    } else {
      results = profileModel.starred!.where((starred) => starred.name!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      update();
    }

    starredList.value = results;
    update();
  }

  Future<void> getProfile(String name) async {
    isLoading.value = true;
    try {
      profileModel = await profileRepository.getProfile(name);

      reposList.value = profileModel.repos!;
      starredList.value = profileModel.starred!;

      isLoading.value = false;
    } catch (e) {
      error.value = true;
      Get.showSnackbar(
        const GetSnackBar(
          title: "Ocorreu um erro",
          message: "Verifique o nome de usuario",
          duration: Duration(seconds: 5),
        ),
      );
      isLoading.value = false;
    }
  }
}
