import 'package:uuid/uuid.dart';

String createUUID() {
  var uuid = Uuid();
  return uuid.v7();
}