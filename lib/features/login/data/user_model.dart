import 'package:hive/hive.dart';
part 'user_model.g.dart'; 
// Imports the generated code for Hive type adapters, which is necessary for storing custom objects in Hive.

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String image;

  UserModel({required this.name, required this.image});
}


@HiveType(typeId: 1)
class TestModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  String image;

  TestModel({required this.name, required this.image});
} 