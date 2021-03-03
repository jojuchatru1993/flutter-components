import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;

  bool _lockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(children: <Widget>[
          _createSlider(),
          _checkBox(),
          _createSwitch(),
          Expanded(child: _createImage())
        ]),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: 'Size',
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_lockCheck)
          ? null
          : (value) {
              setState(() {
                _valueSlider = value;
              });
            },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://i.pinimg.com/originals/38/f9/1b/38f91b2f5dbc4d56e2975a96d41aa21a.png'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _checkBox() {
    // return Checkbox(
    // value: _lockCheck,
    // onChanged: (value) {
    //   setState(() {
    //     _lockCheck = value;
    //   });
    //     });

    return CheckboxListTile(
        title: Text('Lock check'),
        value: _lockCheck,
        onChanged: (value) {
          setState(() {
            _lockCheck = value;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('Lock check'),
        value: _lockCheck,
        onChanged: (value) {
          setState(() {
            _lockCheck = value;
          });
        });
  }
}
