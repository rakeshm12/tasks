import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tasks/app/modules/widgets/custom_dropdown_widget.dart';
import 'package:tasks/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: GetBuilder(
          init: HomeController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdownWidget(
                          key: const Key("country"),
                          values: controller.countries.map((value) {
                            return DropdownMenuItem(
                              value: value.name,
                              child: Text(
                                value.code ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: controller.onChangedCountry,
                          dropDownValue: controller.countryName,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: CustomDropdownWidget(
                          key: const Key("state"),
                          values: controller.states.map((value) {
                            return DropdownMenuItem(
                              value: value.name,
                              child: Text(
                                value.name ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: controller.onChangedState,
                          dropDownValue: controller.stateName,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.PROFILE);
                    },
                    child: const Text("Show Profile"),
                  )
                ],
              )),
            );
          }),
    );
  }
}
