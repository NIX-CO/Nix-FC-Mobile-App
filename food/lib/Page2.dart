import 'package:flutter/material.dart';
import 'package:food/main.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

String stringResponse = "";

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Future apicall() async {
    http.Response response;
    response =
        await http.get(Uri.parse("http://10.0.2.2:8000/organization/api/"));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Terrain"),
        ),
        body: Center(
          child: Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.blue),
            child: Center(
              child: Text(stringResponse.toString()),
            ),
          ),
        ));
  }
}
