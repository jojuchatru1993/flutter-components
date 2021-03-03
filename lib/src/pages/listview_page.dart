import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = new List();
  int _lastItem = 0;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_add10();
        fechData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List'),
        ),
        body: Stack(
          children: <Widget>[_createList(), _createLoading()],
        ));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _getPage1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _listNumbers[index];

          return FadeInImage(
              fit: BoxFit.cover,
              height: 300.0,
              placeholder: AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300/?image=$image'));
        },
      ),
    );
  }

  Future<Null> _getPage1() {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listNumbers.clear();
      _lastItem++;
      _add10();
    });

    return Future.delayed(duration);
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator()]),
          SizedBox(height: 15.0)
        ],
      );
    } else
      return Container();
  }

  void _add10() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _listNumbers.add(_lastItem);
    }

    setState(() {});
  }

  Future<Null> fechData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);

    new Timer(duration, requestHTTP);
  }

  void requestHTTP() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: new Duration(milliseconds: 200));

    _add10();
  }
}
