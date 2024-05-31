import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/secrets.dart';
import 'additional_info_item.dart';
import './Hourly_forecast_item.dart';

import 'package:http/http.dart' as http;

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  Future getCurrentWeather() async {
    String cityName = 'London';
    http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$openWeatherApiKey'),
    );
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('weather App'),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              //can use InkWell which has square reflect
              onPressed: () {},
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //main card
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 10,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            children: [
                              Text(
                                '300K',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Icon(
                                Icons.cloud,
                                size: 64,
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Text(
                                'Rain',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                //weather forecast card

                const Text(
                  'Weather Forecast',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      HourlyForecastItem(
                          time: '06:00', icon: Icons.cloud, temp: '299.89'),
                      HourlyForecastItem(
                          time: '09:00', icon: Icons.sunny, temp: '301.17'),
                      HourlyForecastItem(
                          time: '12:00', icon: Icons.cloud, temp: '311.56'),
                      HourlyForecastItem(
                          time: '15:00', icon: Icons.sunny, temp: '305.12'),
                      HourlyForecastItem(
                          time: '18:00', icon: Icons.cloud, temp: '300.79'),
                      HourlyForecastItem(
                          time: '21:00', icon: Icons.sunny, temp: '313.15'),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                //Additional Information
                const Text(
                  'Additional Information',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInfoItem(
                        icon: Icons.water_drop, label: 'Humidity', value: '91'),
                    AdditionalInfoItem(
                        icon: Icons.air, label: 'Wind Speed', value: '7.09'),
                    AdditionalInfoItem(
                        icon: Icons.beach_access,
                        label: 'Pressure',
                        value: '989'),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

