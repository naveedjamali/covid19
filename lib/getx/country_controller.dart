import 'package:covid19/models/covid_data.dart';
import 'package:covid19/services/remote_services.dart';
import 'package:get/state_manager.dart';

class CountryController extends GetxController {

  var _selectedCountry = CovidData().obs;

  var isLoading = true.obs;
  var countries = <CovidData>[].obs;

  @override
  void onInit() async {
    fetchCovidData();
    super.onInit();
  }

  CovidData getSelectedCountry(){
    return _selectedCountry.value;
  }
  void setSelectedCountry(CovidData data)
  {
    _selectedCountry.value = data;

  }

  void fetchCovidData() async {
    try {
      isLoading(true);
      var dataList = await RemoteServices.fetchData();
      if (dataList != null) countries.value = dataList;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
  
  
}
