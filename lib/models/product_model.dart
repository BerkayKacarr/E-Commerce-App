import 'package:isar/isar.dart';

part 'product_model.g.dart';

@collection
class ProductModel {
  Id id = Isar.autoIncrement;

  late String title;
  late String description;
  late double price;
  late String imageUrl;
  late String category;
  DateTime createdAt = DateTime.now();
}
