import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  _CartPage createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  TextEditingController typeController = TextEditingController();
  String showText = 'DIOでもへようこそ';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('タイトルdemo'),
        ),
        body: Container(
            height: 1000,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: typeController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'タイプ',
                      helperText: 'ヒントテキスト'),
                  autofocus: false,
                ),
                ElevatedButton(
                  onPressed: _choiceAction,
                  child: Text('ok'),
                ),
                Text(
                  showText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            )),
      ),
    );
  }

  void _choiceAction() {
    print('相応のデータを出してる.....');
    if (typeController.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text('書けばいい')));
    } else {
      getHttp(typeController.text.toString()).then((val) {
        if (val != null) {
           setState(() {
            showText = val['id']['title'].toString();
          });
}

      });
    }
  }

  Future getHttp(String TypeText) async {
    try {
      Response response;
      var data = {'name': TypeText};
      response = await Dio().get('https://jsonplaceholder.typicode.com/posts',
          queryParameters: data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
