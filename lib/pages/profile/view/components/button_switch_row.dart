import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/profile_model.dart';
import '../../../../services/custom_colors.dart';
import '../../controller/profile_controller.dart';

class ButtonSwitchRow extends StatelessWidget {
  const ButtonSwitchRow({
    super.key,
    required this.controller,
    required this.profile,
    required this.constrains,
  });
  final BoxConstraints constrains;
  final ProfileController controller;
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: constrains.maxWidth > 1000 ? 70 : 30,
        ),
        GestureDetector(
          onTap: () {
            controller.index.value = 0;
          },
          child: Obx(() => Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      "Repos",
                      style: TextStyle(
                        fontSize: 16,
                        color: CustomColors.cinzaArdosiaDois,
                        fontWeight: controller.index.value == 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 50),
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                      decoration: BoxDecoration(
                        color: CustomColors.cinzaPalido,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "${profile.repos!.length}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: CustomColors.cinzaArdosiaDois,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
        GestureDetector(
          onTap: () {
            controller.index.value = 1;
          },
          child: Obx(() => Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      "Starred",
                      style: TextStyle(
                        fontSize: 16,
                        color: CustomColors.cinzaArdosiaDois,
                        fontWeight: controller.index.value == 1 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                      decoration: BoxDecoration(
                        color: CustomColors.cinzaPalido,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "${profile.starred!.length}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.cinzaArdosiaDois,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
