import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/user_model.dart';

class IsarService {
  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [UserModelSchema],
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
}
