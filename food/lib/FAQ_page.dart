import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'list_item.dart';

void main() => runApp(faq());

class faq extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'FAQ & Informations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Map<dynamic, dynamic>> list_product;
  @override
  void initState() {
    super.initState();
    list_product = [];
    for (var k = 1; k <= 12; k++) {
      Map map = Map();
      map.putIfAbsent(getMonth(k), () => getWeeks());
      list_product.add(map);
    }
    list_product.map((s) {}).map((list) => list).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<String> list = [];

    return Scaffold(
      backgroundColor: Color(0xFFFD8C44),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 61, 56, 125),
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          for (final map in list_product)
            for (final keys in map.keys) ListItem(keys, map[keys].toList()),
        ],
      )),
    );
  }

  String getMonth(int month) {
    switch (month) {
      case 1:
        return "What is Nix FC";
      case 2:
        return "Who created Nix FC";
      case 3:
        return "What are the values of Nix FC";
      case 4:
        return "What is Flutter?";
      case 5:
        return "Who is Flutter for?";
      case 6:
        return "How much development experience do I need to use Flutter?";
      case 7:
        return "What kinds of apps can I build with Flutter?";
      case 8:
        return "What makes Flutter unique?";
      case 9:
        return "Should I build my next production app with Flutter?";
      case 10:
        return "Does Flutter work with any editors or IDEs?";
      case 11:
        return "Does Flutter come with a framework?";
      case 12:
        return "Does Flutter come with widgets?";
      default:
        return "";
    }
  }

  List<dynamic> getWeeks() {
    return [
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ].toList();
  }
}
