import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/models/user_model.dart';
import '../../../data/user_repo/user_repo_impl.dart';

class ProfileController extends GetxController with StateMixin<RxList<User>> {
  final UserRepoImpl _userRepo = UserRepoImpl.instance;

  bool isLoadingPage = false;
  int page = 1;

  UserModel user = UserModel();

  RxList<User> users = RxList();

  @override
  void onInit() {
    super.onInit();
    getUser(page);
  }

  Future getUser(int page) async {
    change(null, status: RxStatus.loading());
    _userRepo.getUserProfile(page).then((response) {
      if (response != null) {
        final data = response.data;
        user = UserModel.fromJson(data);

        final userList =
            (data["data"] as List).map((e) => User.fromJson(e)).toList();

        users.addAll(userList);

        if (users.isNotEmpty) {
          change(users, status: RxStatus.success());
        } else {
          change(users, status: RxStatus.empty());
        }
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  void loadNextPage() {
    isLoadingPage = true;
    page++;

    if (page > user.totalPages) {
      isLoadingPage = false;
      update();
      Get.snackbar("No more items", "No items to display");
      return;
    }
    getUser(page);

    isLoadingPage = false;
    update();
  }
}
