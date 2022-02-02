import 'package:climate_app/constants.dart';
import 'package:climate_app/screen/location_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastScreen extends StatefulWidget {
  LastScreen({@required this.weatherData});
  final weatherData;
  @override
  _LastScreenState createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
  // WeatherModel weather = WeatherModel();
  var temperature;
  var mainCond;
  var weatherIcon;
  var cityName;
  var getTheMessage;
  var hourlyTimeDay;
  var hourlyTimeNight;
  var weatherDescription;
  @override
  void initState() {
    updateUI(widget.weatherData);
    super.initState();
  }

  Future updateUI(weatherFutureForecastDay) async {
    setState(() {
      hourlyTimeDay = weatherFutureForecastDay['sys']['sunrise'];
      hourlyTimeNight = weatherFutureForecastDay['sys']['sunset'];
      double temp = weatherFutureForecastDay['list'][0]['temp']['day'];
      temperature = temp.toInt();
      print(temperature);
      mainCond = weatherFutureForecastDay['weather'][0]['id'];
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
                                  '21°',
                                  style: kTempTextStyle,
                                ),
                                Text(
                                  'Mostly clouds',
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
                              reading: 'level3',
                              condition: 'NE',
                            ),
                            ColumnAdditional(
                              reading: '67%',
                              condition: 'Humidity',
                            ),
                            ColumnAdditional(
                              reading: '19.0',
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
                              onPressed: () {},
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
