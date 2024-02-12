import 'dart:developer';

import 'package:get/get.dart';
import 'package:tasks/app/data/models/country.dart';
import 'package:tasks/app/data/models/state.dart';
import 'package:tasks/app/data/services/api_service.dart';

class HomeController extends GetxController {
  List<CountryModel> countries = [];

  List<State> states = [];

  String? countryName;
  String? stateName;

  final ApiService _apiService = ApiService.instance;

  @override
  void onInit() {
    super.onInit();
    getCountry();
  }

  Future<void> getCountry() async {
    _apiService.parseAssetJson("assets/country.json").then((value) {
      log("value == $value");
      if (value != {}) {
        final countryList = (value["countries"] as List)
            .map((e) => CountryModel.fromJson(e))
            .toList();

        countries = countryList;
        update();
      }
    });
  }

  void onChangedCountry(value) {
    if (stateName != null) stateName = null;
    countryName = value;
    if (countryName != null) {
      getStatesByCountry(countryName!);
    }
    update();
  }

  void onChangedState(value) {
    if (countryName == null) {
      Get.snackbar("Choose country!", "Please choose a country first");
      return;
    }
    stateName = value;
    update();
  }

  Future<void> getStatesByCountry(String country) async {
    _apiService.parseAssetJson("assets/states.json").then((value) {
      if (value != {}) {
        final stateList =
            (value["states"] as List).map((e) => State.fromJson(e)).toList();

        states = stateList.where((element) => element.id == country).toList();
        update();
      }
    });
  }
}
