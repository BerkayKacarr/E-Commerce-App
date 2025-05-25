import 'package:ecommerce_app/models/product_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/user_model.dart';

class IsarService {
  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [UserModelSchema, ProductModelSchema],
      directory: dir.path,
    );
  }

  Future<void> addUser(UserModel user) async {
    await isar.writeTxn(() async {
      await isar.userModels.put(user);
    });
  }

  Future<UserModel?> getUserByEmail(String email) async {
    return await isar.userModels.filter().emailEqualTo(email).findFirst();
  }

  Future<List<UserModel>> getAllUsers() async {
    return await isar.userModels.where().findAll();
  }

  Future<void> addProduct(ProductModel product) async {
    await isar.writeTxn(() async {
      await isar.productModels.put(product);
    });
  }

  Future<List<ProductModel>> getAllProducts() async {
    return await isar.productModels.where().findAll();
  }
}
