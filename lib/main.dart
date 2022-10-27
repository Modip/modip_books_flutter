import 'package:flutter/material.dart';
import 'package:todo_list/screens/admin/addBook_page.dart';
import 'package:todo_list/screens/admin/allBook_page.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modip Books',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      //home: const AddBookPage(),
      //home: const HomePage(),
      home: const Login(),
      // home: const AllBook(),
    );
  }
}
