import 'package:flutter/material.dart';
import 'package:ui_challenger/src/pages/detalle_page.dart';
import 'package:ui_challenger/src/pages/hotel_page.dart';
import 'package:ui_challenger/src/pages/house_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'hotel',
      routes: {
        '/' : (BuildContext context) => HousePage(),
        'detalle' : (BuildContext context) => DetallePage(),
        'hotel' : (BuildContext context) => HotelPage(),
      },
    );
  }
}