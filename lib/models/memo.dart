import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:nihongo_memo/utils/helpers.dart';

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
  late Uint8List image;
  @HiveField(5)
  final List<String> sentences;
  @HiveField(6)
  final Color color;
  
  Memo({required this.id, required this.name, Color? color, Uint8List? image, List<String>? sentences, DateTime? createdAt, DateTime? updatedAt}) : createdAt = createdAt ?? DateTime.now(), updatedAt = updatedAt ?? DateTime.now(), image = image ?? Uint8List.fromList([]), color = color ?? Colors.blue, sentences = [];
}