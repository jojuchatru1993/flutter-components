import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2(),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Card'),
            subtitle: Text('This is the subtitle of the card'),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {},
            )
          ])
        ],
      ),
    );
  }

  Widget _cardType2() {
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[
            FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/3/35/Neckertal_20150527-6384.jpg'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300.0,
              fit: BoxFit.cover,
            ),
            Container(
                padding: EdgeInsets.all(10.0),
                child: Text("I don't have idea")),
          ],
        ));
  }
}
