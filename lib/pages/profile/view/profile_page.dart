import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../services/custom_colors.dart';
import '../controller/profile_controller.dart';

import 'components/app_bar.dart';
import 'components/button_switch_row.dart';
import 'components/repos_widget.dart';
import 'components/starred_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    var reposEC = TextEditingController();
    var starredEC = TextEditingController();

    final name = Get.parameters["profile"];

    final scrollControllerRepos = ScrollController();
    final scrollControllerStarred = ScrollController();

    return FutureBuilder(
      future: controller.getProfile(name ?? "brasizza"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            appBar: appBar,
            body: LayoutBuilder(
              builder: (context, constrains) {
                return GetBuilder<ProfileController>(
                  init: ProfileController(),
                  initState: (_) {},
                  builder: (contro) {
                    final profile = contro.profileModel;
                    if (contro.error.value) {
                      return const Text("Erro");
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                          children: [
                            Visibility(
                              visible: constrains.maxWidth > 1000,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(profile.avatar_url!),
                                    radius: 100,
                                  ),
                                  Text(
                                    profile.name!,
                                    style: const TextStyle(
                                      color: CustomColors.cinzaArdosia,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Visibility(
                                    visible: profile.bio != null,
                                    child: Text(
                                      profile.bio ?? "",
                                      style: const TextStyle(
                                        color: CustomColors.cinzaQuente,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: constrains.maxWidth > 1000 ? 20 : 10),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Visibility(
                                      visible: constrains.maxWidth < 1000,
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(profile.avatar_url!),
                                            radius: 40,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                profile.name!,
                                                style: const TextStyle(
                                                  color: CustomColors.cinzaArdosia,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Visibility(
                                                visible: profile.bio != null,
                                                child: Text(
                                                  profile.bio ?? "",
                                                  style: const TextStyle(
                                                    color: CustomColors.cinzaQuente,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    ButtonSwitchRow(
                                      controller: controller,
                                      profile: profile,
                                      constrains: constrains,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 40, top: 10),
                                          width: constrains.maxWidth > 1000 ? constrains.maxWidth * .6 : constrains.maxWidth * .8,
                                          height: 2,
                                          color: CustomColors.cinzaQuente,
                                        ),
                                        Obx(
                                          () => Visibility(
                                            visible: controller.index.value == 0,
                                            child: Container(
                                              margin: const EdgeInsets.only(top: 7),
                                              color: CustomColors.laranjaEnferrujada,
                                              width: 160,
                                              height: 5,
                                            ),
                                          ),
                                        ),
                                        Obx(
                                          () => Visibility(
                                            visible: controller.index.value == 1,
                                            child: Container(
                                              margin: const EdgeInsets.only(left: 160, top: 7),
                                              color: CustomColors.laranjaEnferrujada,
                                              width: 160,
                                              height: 5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Obx(
                                      () => IndexedStack(
                                        index: controller.index.value,
                                        children: [
                                          ReposWidget(
                                            reposEC: reposEC,
                                            controller: controller,
                                            scrollControllerRepos: scrollControllerRepos,
                                            constrains: constrains,
                                          ),
                                          StarredWidget(
                                            starredEC: starredEC,
                                            scrollControllerStarred: scrollControllerStarred,
                                            controller: controller,
                                            constrains: constrains,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}
