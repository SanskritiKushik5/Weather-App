import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupCityTemp() async{
    print('entered thie');
    CityTemp instance = CityTemp(city: 'Mumbai');
    await instance.getTemp();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'city': instance.city,
      'temp': instance.temp,
      'minTemp': instance.minTemp,
      'maxTemp': instance.maxTemp,
      'desc': instance.desc,
      'icon': instance.icon,
    });
  }

  @override
  void initState() {
    super.initState();
    setupCityTemp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
