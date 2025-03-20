import 'package:hive/hive.dart';

part 'trip_model.g.dart'; // Не забудь про этот импорт!

@HiveType(typeId: 0)
class Trip extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  List<String> cities;

  Trip({required this.name, required this.cities});
}
