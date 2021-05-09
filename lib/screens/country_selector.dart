import 'package:covid19/getx/country_controller.dart';
import 'package:covid19/models/covid_data.dart';
import 'package:covid19/screens/CovidDetailScreen.dart';
import 'package:covid19/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountrySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CountryController countryController = Get.put(CountryController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Covid19'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Obx(() {
          if(countryController.isLoading.value == true)
            return Center(child: CircularProgressIndicator(),);
          else
          return ListView.builder(
            itemCount: countryController.countries.length,
            itemBuilder: (ctx, index) {
              CovidData countrydata = countryController.countries[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(color: Colors.grey[100]),
                    height: 100,
                    constraints: BoxConstraints(maxWidth: 200),
                    child: Material(
                      child: InkWell( onTap: (){countryController.setSelectedCountry(countrydata);
                      Get.to(CovidDetailScreen());
                      },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 10,
                              height: double.infinity,
                              color: Colors.red,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                  getContinent( countrydata.continent), style: TextStyle(color: Colors.red, fontSize: 14),
                                    ),
                                    Text(countrydata.country, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.red),)
                                   , Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Cases',style: TextStyle(color: Colors.red, fontSize: 14),),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(formattedNumber(countrydata.cases),style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),],
                                ),
                              ),
                            ),

                            Container(width: 80,height: 60, decoration: BoxDecoration(border: Border.all(color: Colors.black38, width: 1)),
                              child: Image.network(
                                countrydata.countryInfo.flag,
                                fit: BoxFit.fill,
                                width: 80,
                                height: 60,
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              );
            },
          );
        }),
      ),
    );
  }
}
