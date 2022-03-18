import 'package:climate_app/constants.dart';
import 'package:climate_app/screen/location_screen.dart';
import 'package:climate_app/services/networking.dart';
import 'package:climate_app/services/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

const apiKey = '996ab4186a492e9d6258bec0b099d91c';

class LastScreen extends StatefulWidget {
  LastScreen({@required this.weatherData2});
  final weatherData2;
  @override
  _LastScreenState createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
  WeatherModel weather = WeatherModel();
  var temperature = 0;
  var mainCond;
  var mainCondDescription;
  var weatherIcon;
  var cityName;
  var getTheMessage;
  var hourlyTimeDay;
  var hourlyTimeNight;
  var weatherDescription;
  var humidity;
  var visibility;
  // double? latitude;
  // double? longitude;
  // Future getLocationWeather() async {
  //   LocationPermission permission = await Geolocator.requestPermission();
  //   LocationPermission.always;
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   latitude = position.latitude;
  //   longitude = position.longitude;
  //   NetworkingHelper networkingHelper = NetworkingHelper(
  //       'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
  //
  //   var weatherData = await networkingHelper.getData();
  //   print(weatherData);
  //
  //   return weatherData;
  // }

  var longitude;
  var latitude;
  var feels_like;
  @override
//here is were all data that needs to be loaded before the app runs is placed ie API data

  void initState() {
    super.initState();
    getLocationWeather();
  }

  Future getLocationWeather() async {
    LocationPermission permission = await Geolocator.requestPermission();
    LocationPermission.always;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    latitude = position.latitude;
    longitude = position.longitude;
    NetworkingHelper networkingHelper = NetworkingHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await networkingHelper.getData();

    return updateUI(weatherData);
  }

  Future updateUI(weatherData) async {
    setState(() {
      hourlyTimeDay = weatherData['sys']['sunrise'];
      hourlyTimeNight = weatherData['sys']['sunset'];
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      print(temperature);
      mainCond = weatherData['weather'][0]['id'];
      mainCondDescription = weatherData['weather'][0]['main'];

      weatherIcon = weather.getWeatherIcon(mainCond);
      cityName = weatherData['name'];
      getTheMessage = weather.getMessage(temperature);
      weatherDescription = weatherData['weather'][0]['description'];
      humidity = weatherData['main']['humidity'];
      feels_like = weatherData['main']['feels_like'];
      visibility = weatherData['visibility'];
      // weatherIcon = weather.getWeatherIcon(mainCond);
      // cityName = weatherData['name'];
      // getTheMessage = weather.getMessage(temperature);
      // weatherDescription = weatherData['weather'][0]['description'];
    });
    // final weatherData = await weatherDataFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/Night.jfif'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 300.0,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.all(10.0),
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${temperature}°C',
                                  style: kTempTextStyle,
                                ),
                                Text(
                                  '$weatherDescription',
                                  style: TextStyle(fontSize: 20.0),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            width: 900,
                            margin: EdgeInsets.all(12.0),
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      HourlyForecastColumn(
                                        nextHour: '01:00',
                                        weatherSymbol: '☁',
                                        nextHourTemp: '19.0',
                                      ),
                                      HourlyForecastColumn(
                                        nextHour: '01:00',
                                        weatherSymbol: '☁',
                                        nextHourTemp: '19.0',
                                      ),
                                      HourlyForecastColumn(
                                        nextHour: '01:00',
                                        weatherSymbol: '☁',
                                        nextHourTemp: '19.0',
                                      ),
                                      HourlyForecastColumn(
                                        nextHour: '01:00',
                                        weatherSymbol: '☁',
                                        nextHourTemp: '19.0',
                                      ),
                                      HourlyForecastColumn(
                                        nextHour: '01:00',
                                        weatherSymbol: '☁',
                                        nextHourTemp: '19.0',
                                      ),
                                      HourlyForecastColumn(
                                        nextHour: '01:00',
                                        weatherSymbol: '☁',
                                        nextHourTemp: '19.0',
                                      ),
                                      HourlyForecastColumn(
                                        nextHour: '01:00',
                                        weatherSymbol: '☁',
                                        nextHourTemp: '19.0',
                                      ),
                                      HourlyForecastColumn(
                                        nextHour: '01:00',
                                        weatherSymbol: '☁',
                                        nextHourTemp: '19.0',
                                      ),
                                      HourlyForecastColumn(
                                        nextHour: '01:00',
                                        weatherSymbol: '☁',
                                        nextHourTemp: '19.0',
                                      ),
                                      HourlyForecastColumn(
                                        nextHour: '01:00',
                                        weatherSymbol: '☁',
                                        nextHourTemp: '19.0',
                                      ),
                                      HourlyForecastColumn(
                                        nextHour: '01:00',
                                        weatherSymbol: '☁',
                                        nextHourTemp: '19.0',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                          width: 330.0,
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ColumnAdditional(
                              reading: '$visibility',
                              condition: 'Visibility',
                            ),
                            ColumnAdditional(
                              reading: '${humidity}%',
                              condition: 'Humidity',
                            ),
                            ColumnAdditional(
                              reading: '${feels_like}°C',
                              condition: 'Feels like',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                          width: 330.0,
                          child: Divider(color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      height: 300.0,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.all(12.0),
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DayForecastWidget(
                                  dateAndDay: '01/30 SUN',
                                  symbolIcon: '☁',
                                  tempMinMax: '15/28C',
                                ),
                                DayForecastWidget(
                                  dateAndDay: '01/31 MON',
                                  symbolIcon: '⛈',
                                  tempMinMax: '15/26C',
                                ),
                                DayForecastWidget(
                                  dateAndDay: '02/01 TUE',
                                  symbolIcon: '⛈',
                                  tempMinMax: '15/25C',
                                ),
                                DayForecastWidget(
                                  dateAndDay: '02/02 WED',
                                  symbolIcon: '🌧',
                                  tempMinMax: '15/26C',
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.blue.shade200,
                          onPressed: () {
                            Navigator.pop(context,
                                MaterialPageRoute(builder: (context) {
                              return LocationScreen();
                            }));
                          },
                          child: Icon(Icons.arrow_back_ios_outlined),
                        ),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                // var url = "https://github.com/Jobsidney";
                                // launchLink(url);
                              },
                              child: Text('More Weather Forecast')),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class HourlyForecastColumn extends StatelessWidget {
  HourlyForecastColumn({this.nextHour, this.weatherSymbol, this.nextHourTemp});
  final nextHour;
  final weatherSymbol;
  final nextHourTemp;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(nextHour), Text(weatherSymbol), Text(nextHourTemp)],
    );
  }
}

class ColumnAdditional extends StatelessWidget {
  ColumnAdditional({this.reading, this.condition});
  final reading;
  final condition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(reading), Text(condition)],
    );
  }
}

class DayForecastWidget extends StatelessWidget {
  DayForecastWidget({this.dateAndDay, this.symbolIcon, this.tempMinMax});
  final dateAndDay;
  final symbolIcon;
  final tempMinMax;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          dateAndDay,
          style: kDayForecastText,
        ),
        Text(
          symbolIcon,
          style: kDayForecastText,
        ),
        Text(
          tempMinMax,
          style: kDayForecastText,
        )
      ],
    );
  }
}

// launchLink(String url) async {
//   // await launch(url);
//   await html.window.open(url, 'name');
// }
