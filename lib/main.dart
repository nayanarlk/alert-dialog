import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  MyAppState createState() => new MyAppState();
}

enum MyDialogAction {
  Yes,
  No,
  Maybe
}

class MyAppState extends State<MyApp> {
  String _text = "";

  void _onChange(String value) {
    setState(() {
      _text = value;      
    });
  }

  void _dialogResult(MyDialogAction value) {
    print('You selected $value');
    Navigator.pop(context);
    //A switch statement can be used here to run the app accordin to the user's choice.
  }

  void _showAlert(String value) {
    if(value.isEmpty) {
      return;
    }

    AlertDialog dialog = new AlertDialog(
      content: new Text(value, style: new TextStyle(fontSize: 30.0),),
      actions: <Widget>[
        new FlatButton(child: new Text("Yes"),onPressed: (){_dialogResult(MyDialogAction.Yes);}),
        new FlatButton(child: new Text("No"),onPressed: (){_dialogResult(MyDialogAction.No);}),
        new FlatButton(child: new Text("Maybe"),onPressed: (){_dialogResult(MyDialogAction.Maybe);}),
      ],
    );

    showDialog(context: context, child: dialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Alert Dialog "),),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(onChanged: (String value){_onChange(value);},),
              new RaisedButton(
                child: new Text("Show"),
                onPressed: (){_showAlert(_text);},
              ),
            ],
          ),
        ),
      ),
    );      
  }
}