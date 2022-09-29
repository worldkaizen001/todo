import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacks/src/models/hiveModel.dart';
import 'package:stacks/src/pages/boarding/onboarding_page.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:stacks/src/pages/homepage/homepage_page.dart';


late Box box;
Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final document = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  // await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  box = await Hive.openBox<TodoModel>('box');



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'stacks',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:
      const SplashScreen(),
      //
      // HomePage()



    );
  }
}


