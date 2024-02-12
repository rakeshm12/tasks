import 'package:dio/dio.dart';

abstract class UserRepo {
  Future<Response?> getUserProfile(int page);

  Future<Response?> getProfileDetails({required num userId});
}
