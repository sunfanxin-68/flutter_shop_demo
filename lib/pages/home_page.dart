import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    getHttp();
    return const Scaffold(
        body: Center(
      child: Text('ショップホームページ'),
    ));
  }

  void getHttp() async {
    try {
      Response response;
      response = await Dio().get('https://jsonplaceholder.typicode.com/users/1');
      return print(response);
    } catch (e) {
      return print(e);
    }
  }
}
