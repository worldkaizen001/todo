import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/src/models/hiveModel.dart';
import 'package:todoapp/src/pages/homepage/homepage_page.dart';


late Box box;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await Hive.initFlutter();
  box = await Hive.openBox<TodoModel>('box');
  Hive.registerAdapter(TodoModelAdapter());
  // box = await Hive.openBox('myBox');
  // box.put('TodoModel', TodoModel(title: 'title', reward: 'reward'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


