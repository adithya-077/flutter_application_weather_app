import 'package:flutter/material.dart';

import 'package:flutter_application_weather_app/dataservice/jsonmodel.dart';
import 'package:flutter_application_weather_app/util/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CityWeatherDetail extends StatefulWidget {
  static final String routname = '/CityWeatherDetail';

  const CityWeatherDetail({
    Key? key,
  }) : super(key: key);

  @override
  _CityWeatherDetailState createState() => _CityWeatherDetailState();
}

class _CityWeatherDetailState extends State<CityWeatherDetail> {
  @override
  Widget build(BuildContext context) {
    final obj =
        ModalRoute.of(context)!.settings.arguments as Map<String, WeatherData>;
    final ob = obj['OP'];
    final screeSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screeSize.height * 0.1,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                offset: const Offset(2.0, 2.0),
                blurRadius: 2.0,
                spreadRadius: 1.0,
              ),
            ], borderRadius: BorderRadius.circular(30), color: primaryColor),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.purple.shade100, size: 30),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(2.0, 2.0),
                blurRadius: 2.0,
                spreadRadius: 1.0,
              ),
            ],
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            ob!.cityName,
            style: GoogleFonts.staatliches(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.purple.shade100,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screeSize.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: screeSize.width,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                  color: primaryColor,
                  border: Border.all(color: Colors.purple.shade100, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GridTile(
                  child: GridTileBar(
                    title: Text('NOW AT ${ob.cityName.toUpperCase()}',
                        style: GoogleFonts.staatliches(
                            color: Colors.purple.shade100,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.thermostat,
                      color: Colors.purple.shade100,
                    ),
                    trailing: Row(children: [
                      Text(
                        ob.citytemp.toString(),
                        style: GoogleFonts.staatliches(
                            color: Colors.purple.shade100,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '  C°',
                        style: GoogleFonts.staatliches(
                            color: Colors.purple.shade100,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screeSize.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                  color: primaryColor,
                  border: Border.all(color: Colors.purple.shade100, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(
                        Icons.cloud,
                        color: Colors.purple.shade100,
                        size: 50,
                      ),
                      Text(
                        ' / ',
                        style: GoogleFonts.staatliches(
                            color: Colors.purple.shade100,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.wb_sunny,
                        color: Colors.purple.shade100,
                        size: 50,
                      ),
                    ]),
                    Text(
                      ob.cityWeatherDiscription,
                      style: GoogleFonts.staatliches(
                          color: Colors.purple.shade100,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: screeSize.width,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                  color: primaryColor,
                  border: Border.all(color: Colors.purple.shade100, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GridTile(
                  child: GridTileBar(
                    trailing: Text(ob.cityWindSpeed.toString(),
                        style: GoogleFonts.staatliches(
                            color: Colors.purple.shade100,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.air_outlined,
                      color: Colors.purple.shade100,
                    ),
                    title: Text(
                      '  WIND SPEED',
                      style: GoogleFonts.staatliches(
                          color: Colors.purple.shade100,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
