import 'package:dio/dio.dart';
import 'package:tasks/app/data/end_point/api_endpoints.dart';
import 'package:tasks/app/data/services/api_service.dart';
import 'package:tasks/app/data/user_repo/user_repo.dart';

class UserRepoImpl implements UserRepo {
  static final _singleton = UserRepoImpl();
  static UserRepoImpl get instance => _singleton;

  final _apiService = ApiService.instance;

  @override
  Future<Response?> getUserProfile(int page) async {
    return await _apiService
        .get("${ApiEndPoints.baseUrl}${ApiEndPoints.users}?page=$page");
  }

  @override
  Future<Response?> getProfileDetails({required num userId}) async {
    return await _apiService
        .get("${ApiEndPoints.baseUrl}${ApiEndPoints.users}/$userId");
  }
}
