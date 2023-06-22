import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/pages/index_page.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title:'ネットーショップ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch:Colors.pink,
        ),
        home:IndexPage()
      ),
    );
  }
}
