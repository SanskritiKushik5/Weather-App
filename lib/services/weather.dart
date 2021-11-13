import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class CityTemp {
  late String city;
  String? temp;
  String? minTemp;
  String? maxTemp;
  String? desc;
  String? icon;

  CityTemp({
    required this.city,
  });

  Future<void> getTemp() async {
    try {
      Response response = await get(
          Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=795fe411da7dd7b8f9f7eab551ac9a75&units=metric'));
      Map data = jsonDecode(response.body);

      // Properties from data
      temp = data['main']['temp'].toString();
      minTemp = data['main']['temp_min'].toString();
      maxTemp = data['main']['temp_max'].toString();
      desc = data['weather'][0]['main'];
      if(desc == 'Snow'){
        icon = 'ac_unit_rounded';
      }else if(desc == 'Clear' || desc == 'Haze' || desc == 'Dust'){
        icon = 'wb_sunny_rounded';
      }else if(desc == 'Clouds' || desc == 'Squall' || desc == 'Mist'){
        icon = 'cloud_queue_rounded';
      }else if(desc == 'Ash' || desc == 'Sand' || desc == 'Fog' || desc == 'Smoke' ){
        icon = 'waves';
      }else if(desc == 'Rain' || desc == 'Drizzle'){
        icon = 'beach_access';
      }else{
        icon = 'storm_rounded';
      }

    }catch (e) {
      print('caught error: $e');
    }
  }
}

// snow - ac_unit_rounded:
// Snow

// sun - wb_sunny_rounded:
// Clear, Haze, Dust

// cloud - cloud_queue_rounded:
// Clouds, Squall, Mist

// storm - storm_rounded:
// Tornado, Thunderstorm, Squall

// waves - waves:
// Ash, Sand, Fog

// umbrella - beach_access:
// Rain, Drizzle

