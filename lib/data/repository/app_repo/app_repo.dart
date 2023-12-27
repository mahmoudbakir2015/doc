// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doc/data/model/all_doc_model.dart';
import 'package:doc/data/model/home_model.dart';
import 'package:doc/data/model/specialization_model.dart';
import 'package:doc/data/model/user_model.dart';
import 'package:doc/data/service/app_service/app_service.dart';

import '../../model/doctor_model.dart';

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

  Future<DoctorModel> showDoc(
      {required String authorization, required int id}) async {
    return DoctorModel.fromJson(
      await appService.showDoc(
        authorization: authorization,
        id: id,
      ),
    );
  }

  Future<AllDoctorModel> getAllDoctors({required String authorization}) async {
    return AllDoctorModel.fromJson(
      await appService.getAllDoctors(
        authorization: authorization,
      ),
    );
  }

  Future<AllDoctorModel> searchDoc(
      {required String authorization, required String name}) async {
    return AllDoctorModel.fromJson(
      await appService.searchDoc(
        authorization: authorization,
        name: name,
      ),
    );
  }

  Future<UserModel> userProfile({
    required String authorization,
  }) async {
    return UserModel.fromJson(
      await appService.userProfile(
        authorization: authorization,
      ),
    );
  }

  Future<UserModel> updateProfile({
    required String authorization,
    required Map<String, dynamic> data,
  }) async {
    return UserModel.fromJson(
      await appService.updateProfile(
        authorization: authorization,
        data: data,
      ),
    );
  }
}
