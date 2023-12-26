// ignore_for_file: body_might_complete_normally_catch_error

import 'package:doc/business_logic/cubit/auth_cubit/auth_states.dart';
import 'package:doc/constant/endpoint.dart';
import 'package:doc/core/cashe_helper.dart';
import 'package:doc/data/model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/dio_helper.dart';
import '../../../data/repository/auth/auth_repo.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit()
      : super(
          InitialAuthState(),
        );
  static AuthCubit get(context) => BlocProvider.of(context);
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool checkValue = false;
  AuthRepo? authRepo;
  AuthModel? authModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(InitialLogin());
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
    emit(InitialRegister());
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

  void buildToast({
    required String msg,
    required ToastStates state,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Color? chooseToastColor(ToastStates state) {
    Color? color;
    switch (state) {
      case ToastStates.success:
        color = Colors.green;
        break;
      case ToastStates.warning:
        color = Colors.amberAccent;
        break;
      case ToastStates.error:
        color = Colors.red;
        break;
    }
    return color;
  }

  logOut({required String authorization}) {
    DioHelper.postData(
      endPoint: Endpoint.logout,
      data: null,
      authorization: authorization,
    ).then((value) {
      CacheHelper.clearData(key: 'token');
      CacheHelper.removeData(key: 'token');
      emit(LogoutSuccessed());
    });
  }

  // Future logout() async {
  //   return await authRepo?.logOut(authorization: authorization).then(
  //         (value) => emit(
  //           LogoutSuccessed(),
  //         ),
  //       );
  // }
}

enum ToastStates {
  success,
  error,
  warning,
}
