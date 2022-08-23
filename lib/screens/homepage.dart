import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/screens/cityDetail.dart';
import 'package:flutter_application_weather_app/screens/userprofile.dart';
import 'package:flutter_application_weather_app/util/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dataservice/dataservice.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static final routName = '/homepage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final mapuserObj =
    ModalRoute.of(context)!.settings.arguments as Map<String, User?>;
    //final userObj = mapuserObj['userObj'];
    final screeSize = MediaQuery.of(context).size;
    return Consumer<Data>(builder: (context, ele, _) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, UserProfile.routName);
              },
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.network(
                        'https://i2.wp.com/vectorified.com/images/no-profile-picture-icon-21.jpg'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: screeSize.width,
            height: screeSize.height * 0.5,
            decoration: BoxDecoration(
                color: maincolor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ENTER A CITY",
                    style: GoogleFonts.staatliches(
                      textStyle: TextStyle(
                        color: Colors.purple.shade100,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screeSize.height * 0.05,
                  ),
                  Container(
                    width: screeSize.width * 0.7,
                    child: TextField(
                      cursorColor: Colors.purple.shade100,
                      cursorWidth: 1,
                      autofocus: true,
                      onEditingComplete: () => buttonMain(ele),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                      keyboardType: TextInputType.text,
                      controller: cityController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(30),
                        hintText: 'City Name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.purple.shade100,
                              width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Colors.purple.shade100, width: 2.0)),
                        hintStyle: GoogleFonts.staatliches(
                            textStyle: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white38,
                        )),
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.purple.shade100,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screeSize.height * 0.03,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple.shade100,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                      onPressed: () => buttonMain(ele),
                      child: Text(
                        'get weather',
                        style: GoogleFonts.staatliches(
                            fontSize: 20, color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void buttonMain(Data ele) async {
    final op = await ele.getRequest(cityController.text);
    Navigator.pushNamed(context, CityWeatherDetail.routname,
        arguments: {'OP': op});
    print(op.cityName);
    print(op.citytemp);
    print(op.cityWeatherDiscription);
    print(op.cityWindSpeed);
  }
}
