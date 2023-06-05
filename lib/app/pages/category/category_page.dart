import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/category_controller.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  final controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    controller.getCategories();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: GetX<CategoryController>(builder: (_) {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
                title: Text(
              controller.listCategories[index].name ?? "",
            )),
            itemCount: controller.listCategories.length,
          );
        }
      }),
    );
  }
}
