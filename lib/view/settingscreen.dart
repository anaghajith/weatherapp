import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];

  final String apiKey = '7bbbc42413431e84fcb9209579c9d1c2';
  final String baseurl = 'http://api.openweathermap.org/data/2.5/forecast';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Enter your location',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchweather,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index]),
                );
              },
            ),
          ),
        ],
      ),
    );  }

  Future _searchweather() async {
    String query = _searchController.text;

    if (query.isNotEmpty) {
      String apiUrl = '$baseurl?api_key=$apiKey&query=$query';

      try {
        var response = await http.get(Uri.parse(apiUrl));

        if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body);

          setState(() {
            _searchResults = List.generate(
              data['results'].length,
                  (index) => data['results'][index]['Weather'].toString(),
            );
          });
        } else {
          return   Center(child: CircularProgressIndicator());
        }
      }
      catch (error) {
        print('Error: $error');
      }
    }
  }
}
