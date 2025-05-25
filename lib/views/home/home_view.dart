import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product_controller.dart';

class HomeView extends StatelessWidget {
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ürünler")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addDummyProduct(),
        child: Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.products.isEmpty) {
          return Center(child: Text("Hiç ürün yok"));
        }

        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return Card(
              child: ListTile(
                leading: Image.network(product.imageUrl,
                    width: 50, height: 50, fit: BoxFit.cover),
                title: Text(product.title),
                subtitle: Text("${product.price} ₺"),
              ),
            );
          },
        );
      }),
    );
  }
}
