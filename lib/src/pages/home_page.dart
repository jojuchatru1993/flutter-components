import 'package:componentes/src/pages/providers/menu_providers.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    // menuProvider.chargeData();

    return FutureBuilder(
      future: menuProvider.chargeData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          // Navigator.push(context, route);

          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
