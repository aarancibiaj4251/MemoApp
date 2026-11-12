import 'dart:typed_data';

import 'package:hive_ce/hive_ce.dart';

part 'memo.g.dart';

@HiveType(typeId: 0)
class Memo extends HiveObject{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final DateTime createdAt;
  @HiveField(3)
  final DateTime updatedAt;
  @HiveField(4)
  final Uint8List image;
  @HiveField(5)
  final List<String> sentences;

  Memo({required this.id, required this.name, Uint8List? image, DateTime? createdAt, DateTime? updatedAt, List<String>? sentences}) : createdAt = createdAt ?? DateTime.now(), updatedAt = updatedAt ?? DateTime.now(), image = Uint8List.fromList([]), sentences = [];

  // factory Memo.fromJson(Map<String, dynamic> json) => Memo(
  //   id: json['id'] as String,
  //   name: json['name'] as String,
  // );

  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'name': name,
  // };
}