import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/page_routes/page_routes.dart';

void main() {
  runApp(
    DevicePreview(
      // enabled: true,
      builder: (_) => const MyProd(),
    ),
  );
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}

class MyProd extends StatelessWidget {
  const MyProd({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyProd',
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        fontFamily: "OpenSans",
        useMaterial3: true,
      ),
      initialRoute: "${PagesRoutes.profileRoute}/AldairAvelino",
      getPages: AppPage.pages,
    );
  }
}
