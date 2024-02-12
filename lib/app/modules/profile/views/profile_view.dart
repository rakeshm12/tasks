import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tasks/app/modules/widgets/profile_info.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: controller.obx(
          (users) => ListView.builder(
              itemCount: users!.length + 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (index == users.length)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.loadNextPage();
                          },
                          child: const Text("Load More.."),
                        ),
                      )
                    else
                      ProfileInfo(
                        userId: users[index].id ?? 0,
                        firstName: users[index].firstName ?? "",
                        lastName: users[index].lastName ?? "",
                        email: users[index].email ?? "",
                        image: users[index].avatar ?? "",
                      ),
                  ],
                );
              }),
          onLoading: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          onEmpty: const Center(
            child: Text("Items is empty"),
          )),
    );
  }
}
