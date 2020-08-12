import 'package:flutter/material.dart';

import 'main.dart';
import 'dart:async';


class Create extends StatelessWidget {
  final Memo _memo;

  Create(this._memo);

  Future<DateTime> _selectTime(BuildContext context){
    return showDatePicker(
        context: context,
        initialDate: _memo.date,
        firstDate: DateTime(_memo.date.year -2),
        lastDate: DateTime(_memo.date.year +2)
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('新規リスト作成'),
        ),
        body: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  hintText: "タイトル"
              ),

              controller: new TextEditingController(text: _memo.title),
              onChanged: (String newTitle){
                  _memo.title = newTitle;
              },


            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "内容"
              ),
              controller: new TextEditingController(text: _memo.body),
              onChanged: (String newBody){
                  _memo.body = newBody;
              },
            ),
            RaisedButton(
              child: Text('締め切り日変更'),
              onPressed: (){
                _selectTime(context).then((time){
                  if(time !=null && time!=_memo.date){
                    _memo.date = time;
                  }
                }

                );
              },
            ),
            Center(
              child: FlatButton(
                child: Text('保存'),
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        )
    );
  }
}





