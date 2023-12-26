import 'package:dio/dio.dart';

import '../../../constant/endpoint.dart';
import '../../../core/dio_helper.dart';

class AppService {
  Future<dynamic> getHomeData({required String authorization}) async {
    Response response = await DioHelper.getData(
      endPoint: Endpoint.home,
      authorization: authorization,
    );
    try {
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> getAllSpecializations({required String authorization}) async {
    Response response = await DioHelper.getData(
      endPoint: Endpoint.specialization,
      authorization: authorization,
    );
    try {
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> showDoc(
      {required String authorization, required int id}) async {
    Response response = await DioHelper.getData(
      endPoint: "${Endpoint.doctorShow}/$id",
      authorization: authorization,
    );
    try {
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }
}
