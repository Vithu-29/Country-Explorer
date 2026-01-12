import 'package:hive/hive.dart';

part 'hive_note_model.g.dart';

@HiveType(typeId: 1)
class Note extends HiveObject {
  @HiveField(0)
  String countryName;

  @HiveField(1)
  String content;

  Note({required this.countryName, required this.content});
}
