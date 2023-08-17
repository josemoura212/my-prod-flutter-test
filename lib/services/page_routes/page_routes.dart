import 'package:get/get.dart';

import '../../pages/profile/controller/profile_bindings.dart';
import '../../pages/profile/view/profile_page.dart';

abstract class AppPage {
  static final pages = <GetPage>[
    GetPage(
      page: () => const ProfilePage(),
      name: "${PagesRoutes.profileRoute}/:profile",
      binding: ProfileBindings(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String profileRoute = "/profile";
}
