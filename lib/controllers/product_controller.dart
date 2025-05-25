import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/isar_service.dart';

class ProductController extends GetxController {
  final isarService = IsarService();

  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    final data = await isarService.getAllProducts();
    products.assignAll(data);
  }

  Future<void> addDummyProduct() async {
    final dummy = ProductModel()
      ..title = "Test Ürün"
      ..description = "Bu bir örnek açıklamadır."
      ..price = 299.99
      ..imageUrl = "https://via.placeholder.com/150"
      ..category = "Elektronik";

    await isarService.addProduct(dummy);
    fetchProducts();
  }
}
