import 'package:flutter/material.dart';
import 'dart:io'; // for using HttpClient
import 'dart:convert';

import 'package:food/route.dart'; // for using json.decode()
import 'rsv_field.dart';

void main() {
  runApp(const Page2());
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Organisation',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // The list that contains information about photos
  List _loadedPhotos = [];

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    const apiUrl = 'https://nix-fc.azurewebsites.net/organization/api/';

    HttpClient client = HttpClient();
    client.autoUncompress = true;

    final HttpClientRequest request = await client.getUrl(Uri.parse(apiUrl));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    final HttpClientResponse response = await request.close();

    final String content = await response.transform(utf8.decoder).join();
    final List data = json.decode(content);

    setState(() {
      _loadedPhotos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Organisation'),
        ),
        body: SafeArea(
            child: _loadedPhotos.isEmpty
                ? Center(
                    child: ElevatedButton(
                      onPressed: _fetchData,
                      child: const Text('Load fields'),
                    ),
                  )
                // The ListView that displays photos
                : ListView.builder(
                    itemCount: _loadedPhotos.length,
                    itemBuilder: (BuildContext ctx, index) {
                      // return Card(
                      //     child: ListTile(
                      //   leading: Image.network(
                      //     _loadedPhotos[index]["image"],
                      //     width: 150,
                      //     height: 150,
                      //     fit: BoxFit.cover,
                      //   ),
                      //   title: Text(_loadedPhotos[index]['name']),
                      //   subtitle:
                      //       Text('Field ID: ${_loadedPhotos[index]["id"]}'),
                      //   trailing: TextButton(
                      //     child: Text("Go To map"),
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => NavigationScreen(
                      //                   double.parse(
                      //                       _loadedPhotos[index]["latitude"]),
                      //                   double.parse(_loadedPhotos[index]
                      //                       ["longitude"]))));
                      //     },
                      //   ),
                      // ));
                      return Card(
                        child: Column(
                          children: [
                            Image.network(
                              _loadedPhotos[index]["image"],
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _loadedPhotos[index]['name'],
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Field ID: ${_loadedPhotos[index]["id"]}',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  child: const Text('Go To map'),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NavigationScreen(
                                                    double.parse(
                                                        _loadedPhotos[index]
                                                            ["latitude"]),
                                                    double.parse(
                                                        _loadedPhotos[index]
                                                            ["longitude"]))));
                                  },
                                ),
                                TextButton(
                                  child: const Text('RSV field'),
                                  onPressed: () {
                                    // do something when button 2 is pressed
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FieldsPage()));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    })));
  }
}
