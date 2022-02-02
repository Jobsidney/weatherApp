import 'package:climate_app/constants.dart';
import 'package:climate_app/screen/entryScreen.dart';
import 'package:climate_app/services/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationData, this.weatherFutureForecast});
  final weatherFutureForecast;
  final locationData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  var temperature;
  var mainCond;
  var weatherIcon;
  var cityName;
  var getTheMessage;
  var hourlyTimeDay;
  var hourlyTimeNight;
  var weatherDescription;
  var weatherFutureForecastDay;
  @override
  void initState() {
    super.initState();
    weatherFutureForecastDay = widget.weatherFutureForecast;

    updateUI(widget.locationData);
  }

  Future updateUI(weatherData) async {
    setState(() {
      hourlyTimeDay = weatherData['sys']['sunrise'];
      hourlyTimeNight = weatherData['sys']['sunset'];
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      print(temperature);
      mainCond = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(mainCond);
      cityName = weatherData['name'];
      getTheMessage = weather.getMessage(temperature);
      weatherDescription = weatherData['weather'][0]['description'];
    });
    // final weatherData = await weatherDataFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/R.jfif'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: LiquidPullToRefresh(
              color: Colors.transparent,
              borderWidth: 3.0,
              springAnimationDurationInMilliseconds: 300,
              backgroundColor: Colors.red,
              onRefresh: () async {
                var weatherData = await weather.getLocationWeather();
                updateUI(weatherData);
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            FlatButton(
                              onPressed: () async {
                                var weatherData =
                                    await weather.getLocationWeather();
                                updateUI(weatherData);
                              },
                              child: Icon(
                                Icons.wifi_protected_setup_outlined,
                                size: 50.0,
                              ),
                            ),
                            Text('tap reload')
                            //
                          ],
                        ),
                        FlatButton(
                          onPressed: () async {
                            var typedName = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CityScreen();
                            }));
                            if (typedName != null) {
                              var weatherData =
                                  await weather.getCityWeather(typedName);
                              updateUI(weatherData);
                            }
                          },
                          child: Icon(
                            Icons.location_city,
                            size: 50.0,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Container(
                        height: 300.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: <Widget>[
                                Text(
                                  '${temperature}°',
                                  style: kTempTextStyle,
                                ),
                                Text(
                                  '$weatherIcon',
                                  style: kConditionTextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                              width: 300.0,
                              child: Divider(
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  weatherDescription,
                                  style: TextStyle(fontSize: 30.0),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 300.0,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        '$getTheMessage $cityName',
                        textAlign: TextAlign.right,
                        style: kMessageTextStyle,
                      ),
                    ),
                    Container(
                      height: 420.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('More..  '),
                          FloatingActionButton(
                              backgroundColor: Colors.blue.shade200,
                              child: Icon(Icons.arrow_forward_ios_sharp),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LastScreen(
                                      // weatherData: weatherFutureForecastDay,
                                      );
                                }));
                              })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
