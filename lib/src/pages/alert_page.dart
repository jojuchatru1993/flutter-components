import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
          child: RaisedButton(
        child: Text('Show Alert'),
        color: Colors.blue,
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () => _showAlert(context),
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text('Alert'),
            content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Text('This is the content'),
              FlutterLogo(
                size: 100.0,
              )
            ]),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel')),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Ok'))
            ],
          );
        });
  }
}
