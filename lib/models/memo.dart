import 'package:hive_ce/hive_ce.dart';

part 'memo.g.dart';

@HiveType(typeId: 0)
class Memo extends HiveObject{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;

  Memo({required this.id, required this.name});

  // factory Memo.fromJson(Map<String, dynamic> json) => Memo(
  //   id: json['id'] as String,
  //   name: json['name'] as String,
  // );

  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'name': name,
  // };
}