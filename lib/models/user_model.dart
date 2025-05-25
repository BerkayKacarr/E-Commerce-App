import 'package:isar/isar.dart';

part 'user_model.g.dart';

@collection
class UserModel {
  Id id = Isar.autoIncrement;

  late String name;
  late String email;
  late String password;

  // Tarih eklemek istersen
  DateTime createdAt = DateTime.now();
}
