import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../services/custom_colors.dart';

AppBar appBar = AppBar(
  title: Row(
    children: [
      Icon(
        MdiIcons.github,
        color: Colors.white,
        size: 35,
      ),
      const SizedBox(
        width: 5,
      ),
      const Text(
        "Github",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      const Text(
        "profiles",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ],
  ),
  backgroundColor: CustomColors.cinzaArdosia,
);
