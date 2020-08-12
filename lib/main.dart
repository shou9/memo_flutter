
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Detail.dart';
import 'Create.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Memo{
  String title;
  String body;
  int deleteCount ;
  DateTime date = new DateTime.now();
  Memo(this.title,this.body,this.deleteCount,this.date); //コンストラクタ
}

class _MyHomePageState extends State<MyHomePage> {

 List<Memo> memos = new List<Memo>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('Todoリスト'),
      ),

      body: new ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: memos.length,

        itemBuilder: (context,int i){

          return Column(
            children: <Widget>[
             ListTile(
              title:Text(
                memos[i].title,
              ),
              onTap: ()  async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detail(memos[i])
                 )
                );
                if(memos[i].deleteCount==1){
                  memos.removeAt(i);
                }
                setState(() {

                });
              },
             ),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('締め切り日:' + memos[i].date.toString().substring(0,10)),
              ),
              Divider(),
            ],
          );


        },
      ),

      floatingActionButton: new FloatingActionButton(


          onPressed: () async { //async:非同期で実行される
            Memo newMemo = new Memo('','',0,new DateTime.now());
            memos.add(newMemo);

              final result = await Navigator.push( //await:処理が完了するまで待つ
                context,
                new MaterialPageRoute(
                    builder: (context) => Create(newMemo)),
              );
              setState(() {

              });
          },
        tooltip: 'add note',
        child: Icon(Icons.add),
      ),
    );
  }
}
