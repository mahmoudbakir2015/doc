// ignore_for_file: body_might_complete_normally_catch_error

import 'package:doc/business_logic/cubit/auth_cubit/auth_states.dart';
import 'package:doc/constant/endpoint.dart';
import 'package:doc/data/model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/dio_helper.dart';
import '../../../data/repository/auth/auth_repo.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit()
      : super(
          InitialAuthState(),
        );
  static AuthCubit get(context) => BlocProvider.of(context);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool checkValue = false;
  AuthRepo? authRepo;
  AuthModel? authModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    DioHelper.postData(
      data: {
        'email': email,
        'password': password,
      },
      endPoint: Endpoint.login,
    ).then(
      (value) {
        authModel = AuthModel.fromJson(value.data);
        emit(
          LoginSuccessed(authModel: authModel!),
        );
      },
    ).catchError(
      (error) {
        emit(
          LoginFailed(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }

  void userRegister({
    required String email,
    required String name,
    required String phone,
    required String password,
    required int gender,
  }) async {
    DioHelper.postData(
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
        'phone': phone,
        'gender': gender,
      },
      endPoint: Endpoint.register,
    ).then(
      (value) {
        authModel = AuthModel.fromJson(value.data);
        emit(
          RegisterSuccessed(authModel: authModel!),
        );
      },
    ).catchError(
      (error) {
        emit(
          RegisterFailed(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }

  // Future register({required dynamic data}) async {
  //   return await authRepo
  //       ?.createUser(
  //         data: data,
  //       )
  //       .then((value) => {
  //             emit(
  //               RegisterSuccessed(
  //                 authModel: value,
  //               ),
  //             )
  //           })
  //       .catchError((error) {
  //     emit(
  //       RegisterFailed(
  //         errorMessage: error.toString(),
  //       ),
  //     );
  //   });
  // }

  // void userLogin({
  //   required String email,
  //   required String password,
  // }) {
  //   authRepo.checkuser(data: {
  //     'email': email,
  //     'password': password,
  //   }).then(
  //     (value) {
  //       authModel = AuthModel.fromJson(value.data);
  //       emit(LoginSuccessed(authModel: authModel!));
  //     },
  //   ).catchError(
  //     (error) {
  //       emit(
  //         LoginFailed(
  //           errorMessage: error.toString(),
  //         ),
  //       );
  //     },
  //   );
  // }

  Future logout({required String authorization}) async {
    return await authRepo?.logOut(authorization: authorization).then(
          (value) => emit(
            LogoutSuccessed(),
          ),
        );
  }
}
