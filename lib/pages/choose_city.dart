import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';

class ChooseCity extends StatefulWidget {
  const ChooseCity({Key? key}) : super(key: key);

  @override
  _ChooseCityState createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {

  List<CityTemp> locations = [
    CityTemp(city: 'Mumbai'),
    CityTemp(city: 'Delhi'),
    CityTemp(city: 'Chennai'),
    CityTemp(city: 'Ranchi'),
    CityTemp(city: 'Jaipur'),
    CityTemp(city: 'Bengaluru'),
    CityTemp(city: 'Kanpur'),
    CityTemp(city: 'Visakhapatnam'),
  ];
  void updateTime(index) async {
    CityTemp instance = locations[index];
    await instance.getTemp();
    Navigator.pop(context, {
      'city': instance.city,
      'temp': instance.temp,
      'minTemp': instance.minTemp,
      'maxTemp': instance.maxTemp,
      'desc': instance.desc,
      'icon': instance.icon,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  tileColor: Colors.grey[300],
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].city),
                ),
              ),
            );
          }
      ),
    );
  }
}
