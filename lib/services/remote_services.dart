import 'package:covid19/models/covid_data.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<CovidData>> fetchData() async {
    var request = http.Request('GET', Uri.parse('https://corona.lmao.ninja/v2/countries?yesterday&sort'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var json = await response.stream.bytesToString();
     return covidDataFromJson(json);

    }
    else {
      print(response.reasonPhrase);
    }
    return null;
  }
}
