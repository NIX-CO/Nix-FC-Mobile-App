import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Field {
  final int id;
  final String name;
  final String size;
  final String image;

  Field(
      {required this.id,
      required this.name,
      required this.size,
      required this.image});

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      id: json['id'],
      name: json['name'],
      size: json['size'],
      image: json['image'],
    );
  }
}

class FieldsPage extends StatefulWidget {
  @override
  _FieldsPageState createState() => _FieldsPageState();
}

class _FieldsPageState extends State<FieldsPage> {
  List<Field> fields = [];
  Field? selectedField;
  DateTime? startDate;
  DateTime? endDate;

  Future<List<Field>> fetchFields() async {
    final response = await http
        .get(Uri.parse('https://nix-fc.azurewebsites.net/fields/api/fields/'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((field) => Field.fromJson(field)).toList();
    } else {
      throw Exception('Failed to load fields');
    }
  }

  Future<void> postData() async {
    try {
      if (selectedField != null && startDate != null && endDate != null) {
        final url = Uri.parse(
            'https://nix-fc.azurewebsites.net/reservation/api/reserve/');
        final body = json.encode({
          'Field': selectedField!.name,
          'User': 'haitam',
          'Start time': startDate!.toIso8601String(),
          'End time': endDate!.toIso8601String(),
        });
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
        if (response.statusCode == 200) {
          // Data posted successfully
          print('Data posted successfully');
        } else {
          // Error occurred while posting data
          print('Error occurred while posting data');
        }
      } else {
        // Required fields are missing
        print('Please select all fields');
      }
    } catch (error) {
      // Exception occurred during the request
      print('Error: $error');
    }
  }

  @override
  void initState() {
    fetchFields().then((value) {
      setState(() {
        fields = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fields Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<Field>(
              value: selectedField,
              decoration: InputDecoration(
                labelText: 'Field',
                border: OutlineInputBorder(),
              ),
              onChanged: (Field? newValue) {
                setState(() {
                  selectedField = newValue;
                });
              },
              items: fields.map<DropdownMenuItem<Field>>((Field field) {
                return DropdownMenuItem<Field>(
                  value: field,
                  child: Text(field.name),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                DatePicker.showDateTimePicker(
                  context,
                  showTitleActions: true,
                  onConfirm: (date) {
                    setState(() {
                      startDate = date;
                    });
                  },
                  currentTime: DateTime.now(),
                );
              },
              child: Text(
                'Select Start Date',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                DatePicker.showDateTimePicker(
                  context,
                  showTitleActions: true,
                  onConfirm: (date) {
                    setState(() {
                      endDate = date;
                    });
                  },
                  currentTime: DateTime.now(),
                );
              },
              child: Text(
                'Select End Date',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Start Date: ${startDate ?? 'Not selected'}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'End Date: ${endDate ?? 'Not selected'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                postData();
              },
              child: Text(
                'Reserve',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Fields Page',
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    home: FieldsPage(),
  ));
}
