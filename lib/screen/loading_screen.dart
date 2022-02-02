import 'package:climate_app/screen/location_screen.dart';
import 'package:climate_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '996ab4186a492e9d6258bec0b099d91c';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  //here is were all data that needs to be loaded before the app runs is placed ie API data

  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    //the LOCATION class is located on the location.dart file and does all the decoding and json stuff to get data you can read
    // LocationPermission permission = await Geolocator.checkPermission();

    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    var weatherFutureForecast = await weatherModel.getFutureDayForecast();
//the below will navigate to the next screen only when data has finished loading to the app from the internet
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationData: weatherData,
        weatherFutureForecast: weatherFutureForecast,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // padding: EdgeInsets.all(10.0),
        // margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/earth.jfif'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitCircle(
                color: Colors.red,
                size: 100.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Loading....',
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
