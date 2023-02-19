import 'package:flutter/material.dart';
import 'package:shayari/shayari.dart';
void main ()
{
  runApp(MyApp());

}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        'loveshayari':(context) =>shayari(),

      },
      home:shayari(),debugShowCheckedModeBanner: false,
    );
  }
}
