//
// import 'package:hive/hive.dart';
//
// import '../models/todoModel.dart';
//
// class TodoDataBase {
//
//   final _myBox = Hive.box('myBox');
//
//   List<TodoModel> todoModelList = [
//     // TodoModel(reward: 'rice ',title: 'Finishing vent app',completionTime: '10mins'),
//     // TodoModel(reward: 'beans ',title: 'exercise',completionTime: '30mins'),
//   ];
//
//   void initialOpening (){
//
//     todoModelList = [
//       TodoModel(reward: 'rice ',title: 'Finishing vent app',completionTime: '10mins'),
//       TodoModel(reward: 'beans ',title: 'exercise',completionTime: '30mins'),
//     ];
//
//   }
//
//   void loadData (){
//
//     // List<TodoModel> todoModelList = _myBox.get("TODOLIST");
//
//   }
//   void updateDatabase (){
//
//      _myBox.put("TODOLIST", todoModelList);
//
//   }
//
// }