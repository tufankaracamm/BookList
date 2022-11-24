import 'package:book_app/screens/book_list_screen.dart';
import 'package:book_app/screens/reading_list_screen.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        "/":(context)=>BookListScreen(),
        "reading-list":(context)=>ReadingListScreen(),
      } ,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
    );
  }
}