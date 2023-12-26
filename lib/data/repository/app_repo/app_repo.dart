// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doc/data/model/home_model.dart';
import 'package:doc/data/model/specialization_model.dart';
import 'package:doc/data/service/app_service/app_service.dart';

class AppRepo {
  AppService appService;
  AppRepo({
    required this.appService,
  });
  Future<HomeModel> getHomeData({
    required String authorization,
  }) async {
    return HomeModel.fromJson(await appService.getHomeData(
      authorization: authorization,
    ));
  }

  Future<SpecializationModel> getAllSpecializations(
      {required String authorization}) async {
    return SpecializationModel.fromJson(
      await appService.getAllSpecializations(
        authorization: authorization,
      ),
    );
  }
}
