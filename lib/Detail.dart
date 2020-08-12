import 'package:flutter/material.dart';
import 'main.dart';

class Detail extends StatelessWidget {
  final Memo _memo;

  Detail(this._memo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('メモ内容'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              _memo.deleteCount=1;
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              _memo.title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Divider(),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              _memo.body,
            ),
          ),
          Divider(),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '締め切り日:' + _memo.date.toString().substring(0,10),
            ),
          ),


        ],
      ),
    );
  }
}

