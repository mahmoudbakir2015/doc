import 'package:dio/dio.dart';
import '../../../constant/endpoint.dart';
import '../../../core/dio_helper.dart';

class AuthService {
  Future<dynamic> createUser({required dynamic data}) async {
    Response response = await DioHelper.postData(
      endPoint: Endpoint.register,
      data: data,
    );
    try {
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> checkuser({required dynamic data}) async {
    Response response = await DioHelper.postData(
      endPoint: Endpoint.login,
      data: data,
    );
    try {
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> logOut({required String authorization}) async {
    Response response = await DioHelper.dio!.post(Endpoint.logout,
        options: Options(headers: {
          "Authorization": authorization,
          'Content-Type': 'application/json',
          "Accept": "application/json"
        }));
    try {
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }
}
