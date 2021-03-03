import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/originals/ef/b8/eb/efb8eb427dc6c0f35a3d72a82b0dee62.png'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('J'),
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
      body: Center(
          child: FadeInImage(
        image: NetworkImage(
            'https://i.pinimg.com/originals/bf/a5/3b/bfa53b2488eb224410ac1edfbecb2a34.png'),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
      )),
    );
  }
}
