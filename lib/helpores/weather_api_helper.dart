import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_pk_singleton_class_helperclass/models/wether.dart';

class WeatherAPHelper {
  WeatherAPHelper._();
  static final WeatherAPHelper weatherAPHelper = WeatherAPHelper._();

  final String BASE_URL = "https://api.openweathermap.org/data/2.5";
  final String ENDPOINT =
      "/weather?q=surat,in&appid=3fba4f07155c8887a3bbea0c81a7c258";

  Future<Weather?>fetchWeatherData()async{
      http.Response res = await http.get(Uri.parse(BASE_URL + ENDPOINT));

      if(res.statusCode == 200 ){

        Map<String,dynamic>decodedData = jsonDecode(res.body);
        Weather weather = Weather.fromjson(json: decodedData);

        return weather;
      }
      return null;
  }
}
