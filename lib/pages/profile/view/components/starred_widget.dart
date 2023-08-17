import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../../../../services/custom_colors.dart';
import '../../controller/profile_controller.dart';

class StarredWidget extends StatelessWidget {
  const StarredWidget({
    super.key,
    required this.starredEC,
    required this.scrollControllerStarred,
    required this.controller,
    required this.constrains,
  });
  final BoxConstraints constrains;
  final TextEditingController starredEC;
  final ScrollController scrollControllerStarred;
  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          child: TextFormField(
            maxLines: 1,
            controller: starredEC,
            onFieldSubmitted: (value) {
              controller.runFilterStarred(value);
            },
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(
              label: Row(
                children: const [
                  SizedBox(width: 5),
                  Icon(Icons.search, color: CustomColors.cinzaQuente),
                  SizedBox(width: 15),
                  Text(
                    "Filter by name",
                    style: TextStyle(color: CustomColors.cinzaQuente),
                  ),
                ],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: CustomColors.brancoDois,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: CustomColors.cinzaQuente,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: constrains.maxHeight * .6,
          width: constrains.maxWidth > 1000 ? constrains.maxWidth * .6 : constrains.maxWidth * .8,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            controller: scrollControllerStarred,
            itemCount: controller.starredList.length,
            itemBuilder: (context, index) {
              // return Text(controller.reposList[index].name!);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "${controller.starredList[index].owner!.login} / ",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            controller.starredList[index].name!,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      controller.starredList[index].description ?? "",
                      style: const TextStyle(
                        color: CustomColors.cinzaAcastanhado,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          color: CustomColors.cinzaAcastanhado,
                        ),
                        Text(
                          "${controller.starredList[index].stargazers_count}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: CustomColors.cinzaAcastanhado,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        controller.starredList[index].forks_count! > 0
                            ? const Icon(
                                FontAwesome.fork,
                                size: 18,
                                color: CustomColors.cinzaAcastanhado,
                              )
                            : const Text(""),
                        controller.starredList[index].forks_count! > 0
                            ? Text(
                                "${controller.starredList[index].forks_count}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: CustomColors.cinzaAcastanhado,
                                ),
                              )
                            : const Text(""),
                      ],
                    ),
                  ),
                  const Divider(
                    color: CustomColors.cinzaQuente,
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
