import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/font_controller.dart';
import 'screen/setting.dart';

class MyApp extends StatelessWidget {
  final FontSizeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          title: 'Font Size Example',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
              headlineLarge: TextStyle(
                  fontSize: controller
                      .fontSizes[controller.selectedFontSize.value]?['2xl'],
                  fontWeight: FontWeight.bold),
              titleLarge: TextStyle(
                  fontSize: controller
                      .fontSizes[controller.selectedFontSize.value]?['xl'],
                  fontWeight: FontWeight.w500),
              titleSmall: TextStyle(
                  fontSize: controller
                      .fontSizes[controller.selectedFontSize.value]?['lg'],
                  fontWeight: FontWeight.bold),
              bodyLarge: TextStyle(
                  fontSize: controller
                      .fontSizes[controller.selectedFontSize.value]?['base']),
              labelLarge: TextStyle(
                  fontSize: controller
                      .fontSizes[controller.selectedFontSize.value]?['sm']),
              bodySmall: TextStyle(
                  fontSize: controller
                      .fontSizes[controller.selectedFontSize.value]?['xs']),
            ),
          ),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  final FontSizeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Customize Font Size',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Get.to(SettingPage());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Headline Large",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "Title Large",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "Title Small",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              "Body Large",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Label Large",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              "Body Small",
              style: Theme.of(context).textTheme.bodySmall, // add color gray
            ),
            for (var size in ["Small", "Medium", "Large"])
              RadioListTile(
                title: Text(
                  size,
                  style: TextStyle(
                      fontSize: size == 'Large'
                          ? 20
                          : size == 'Medium'
                              ? 16
                              : 12),
                ),
                value: size,
                groupValue: controller.selectedFontSize.value,
                onChanged: (value) {
                  controller.changeFontSize(value!);
                },
              ),
          ],
        ),
      ),
    );
  }
}
