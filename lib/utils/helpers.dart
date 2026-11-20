import 'dart:math';

import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

String createUUID() {
  var uuid = Uuid();
  return uuid.v7();
}

Color randomColor() {
  const colors = [Colors.blueAccent, Colors.pink, Colors.deepPurpleAccent, Colors.amberAccent];
  return colors[Random().nextInt(4)];
}