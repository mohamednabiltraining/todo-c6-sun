import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_c6_sun/firebase_options.dart';
import 'package:todo_c6_sun/home/home_screen.dart';
import 'package:todo_c6_sun/my_database/my_database.dart';
import 'package:todo_c6_sun/my_database/task.dart';
import 'package:todo_c6_sun/my_theme.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance
  .disableNetwork();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
      }
    );
  }
}
