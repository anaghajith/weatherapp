import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class API{
  final String baseurl = "http://api.openweathermap.org/data/2.5/forecast";
  static const apiKey = "7bbbc42413431e84fcb9209579c9d1c2";

  Future<Map<String,dynamic>>fetchLocationData() async{
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
    final response = await http.get(Uri.parse("$baseurl?id=524901&appid=$apiKey"));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      throw Exception("failed to find data");
    }
  }
}

//http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=7bbbc42413431e84fcb9209579c9d1c2