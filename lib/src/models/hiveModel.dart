import 'package:hive/hive.dart';

import 'package:hive/hive.dart';
import 'package:stacks/src/models/todoModel.dart';

part 'hiveModel.g.dart';

@HiveType(typeId: 1)
class TodoModel {

  TodoModel({ required this.title,  required this.reward});
  @HiveField(0)
  String title;

  @HiveField(1)
  String reward;


}