import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../controllers/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          Obx(() {
            return IconButton(
              icon: Icon(
                ThemeController.instance.isDark.value
                    ? Iconsax.sun_1
                    : Iconsax.moon,
              ),
              onPressed: ThemeController.instance.toggleTheme,
            );
          }),
        ],
      ),
      body: Center(child: Text('Hello World!')),
    );
  }
}
