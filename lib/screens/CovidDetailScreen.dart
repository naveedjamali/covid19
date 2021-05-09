import 'dart:ui';

import 'package:covid19/getx/country_controller.dart';
import 'package:covid19/screens/country_selector.dart';
import 'package:covid19/utils/utils.dart';
import 'package:covid19/widgets/detailcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class CovidDetailScreen extends StatelessWidget {
  const CovidDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CountryController countryController = Get.put(CountryController());
    var details = countryController.getSelectedCountry();
    DateTime time = DateTime.fromMillisecondsSinceEpoch(details.updated);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    details.countryInfo.flag,
                    fit: BoxFit.fitWidth,
                  ),
                  ClipRRect(
                    // Clip it cleanly.
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.grey.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.red.withOpacity(0.5),
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    height: 300,
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Icon(
                      Icons.coronavirus_outlined,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: TextButton(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  blurRadius: 0.5,
                                  color: Colors.black,
                                  offset: Offset(0.5, 0.5))
                            ]),
                            child: Icon(
                              Icons.flag,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 04),
                          Text(
                            'Change Location',
                            style: TextStyle(color: Colors.white, shadows: [
                              Shadow(
                                  color: Colors.black,
                                  blurRadius: 1.0,
                                  offset: Offset(0.5, 0.5))
                            ]),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Get.offAll(CountrySelector());
                      },
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 20,
                      child: Row(
                        children: [
                          ClipRRect(
                            child: Container(
                              child: Image.network(
                                details.countryInfo.flag,
                                fit: BoxFit.fill,
                              ),
                              width: 50,
                              height: 33,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1.0,
                                        color: Colors.black,
                                        offset: Offset(0.5, 0.5))
                                  ]),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            details.country,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                shadows: [
                                  Shadow(
                                      color: Colors.black,
                                      blurRadius: 2.0,
                                      offset: Offset(1.0, 1.0))
                                ]),
                          )
                        ],
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "Last updated: " + generateDate(time),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            ),
            DetailCard(
              icon: Icons.coronavirus_outlined,
              primaryLabel: 'Total Cases',
              primaryData: details.cases,
              gradColor1: Colors.red,
              gradColor2: Colors.red[800],
              secondaryData: details.todayCases,
            ),
            DetailCard(
              icon: Icons.local_hospital_outlined,
              primaryLabel: 'Recovered',
              primaryData: details.recovered,
              gradColor1: Colors.green,
              gradColor2: Colors.green[800],
              secondaryData: details.todayRecovered,
            ),
            DetailCard(
              icon: Icons.local_hospital,
              primaryLabel: 'Deaths',
              primaryData: details.deaths,
              gradColor1: Colors.blue,
              gradColor2: Colors.blue[800],
              secondaryData: details.todayDeaths,
            ),
          ],
        ),
      ),
    );
  }
}
