import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../../../../services/custom_colors.dart';
import '../../controller/profile_controller.dart';

class ReposWidget extends StatelessWidget {
  const ReposWidget({
    super.key,
    required this.reposEC,
    required this.controller,
    required this.scrollControllerRepos,
    required this.constrains,
  });
  final BoxConstraints constrains;
  final TextEditingController reposEC;
  final ProfileController controller;
  final ScrollController scrollControllerRepos;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          child: TextFormField(
            maxLines: 1,
            controller: reposEC,
            onFieldSubmitted: (value) {
              controller.runFilterRepos(value);
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
          width: constrains.maxWidth > 1000 ? constrains.maxWidth * .6 : constrains.maxWidth * .7,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            controller: scrollControllerRepos,
            itemCount: controller.reposList.length,
            itemBuilder: (context, index) {
              // return Text(controller.reposList[index].name!);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                    child: Text(
                      controller.reposList[index].name!,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      controller.reposList[index].description ?? "",
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
                        controller.reposList[index].language != null
                            ? SizedBox(
                                height: 25,
                                width: 30,
                                child: Stack(
                                  children: const [
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Icon(
                                        Icons.keyboard_arrow_left,
                                        color: CustomColors.cinzaAcastanhado,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 10,
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: CustomColors.cinzaAcastanhado,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const Text(""),
                        Text(
                          controller.reposList[index].language ?? "",
                          style: const TextStyle(
                            fontSize: 18,
                            color: CustomColors.cinzaAcastanhado,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        controller.reposList[index].forks_count! > 0
                            ? const Icon(
                                FontAwesome.fork,
                                size: 18,
                                color: CustomColors.cinzaAcastanhado,
                              )
                            : const Text(""),
                        controller.reposList[index].forks_count! > 0
                            ? Text(
                                "${controller.reposList[index].forks_count}",
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
