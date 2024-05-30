import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import './Hourly_Forecast_Item.dart';
import 'additonal_info_item.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  Future getCurrentWeather() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          // InkWell(
          //   child: const Icon(Icons.refresh),
          //   onTap: () {
          //     print('Refresh');
          //   },
          // ),

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Card for 1st step
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              '300K',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Icon(
                              Icons.cloud,
                              size: 64,
                            ),
                            SizedBox(
                              height: 16,
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
              //main card

              const SizedBox(
                height: 20,
              ),
              //wether forecast cards
              const Text(
                'Weather Forecast',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HourlyForecastItem(
                      time: '00:00',
                      tempreture: '300.02',
                      icon: Icons.cloud,
                    ),
                    HourlyForecastItem(
                      time: '03:00',
                      tempreture: '415.30',
                      icon: Icons.sunny,
                    ),
                    HourlyForecastItem(
                      time: '06:00',
                      tempreture: '303.02',
                      icon: Icons.sunny,
                    ),
                    HourlyForecastItem(
                      time: '09:00',
                      tempreture: '312.02',
                      icon: Icons.cloud,
                    ),
                    HourlyForecastItem(
                      time: '12:00',
                      tempreture: '330.02',
                      icon: Icons.sunny,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //additional information
              const Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 8,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Additionalinfoitem(
                    icon: Icons.water_drop,
                    label: 'Humidity',
                    value: '94',
                  ),
                  Additionalinfoitem(
                    icon: Icons.air,
                    label: 'Wind Speed',
                    value: '7.12',
                  ),
                  Additionalinfoitem(
                    icon: Icons.beach_access_outlined,
                    label: 'Pressure',
                    value: '1000',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
