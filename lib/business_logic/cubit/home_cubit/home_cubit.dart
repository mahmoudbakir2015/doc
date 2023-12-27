import 'package:doc/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:doc/business_logic/cubit/home_cubit/home_states.dart';

import 'package:doc/data/repository/app_repo/app_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/cashe_helper.dart';
import '../../../presentation/chat/message_page/messages_page.dart';
import '../../../presentation/home/home_screen/home_screen.dart';
import '../../../presentation/my_appointment/my_appointment_screen/my_appointment_screen.dart';
import '../../../presentation/profile/profile.dart';
import '../../../presentation/search/search.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit({required this.appRepo}) : super(InitialHomeState());
  final AppRepo appRepo;
  static AppCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  List<Widget> screen = [
    Home(
      token: CacheHelper.getData(key: 'token').toString(),
    ),
    MessagesView(),
    SearchView(
      token: CacheHelper.getData(key: 'token').toString(),
    ),
    const AppointmentView(),
    const ProfilePage(),
  ];
  int currentIndex = 0;
  void changeNav({required int tap}) {
    currentIndex = tap;
    switch (currentIndex) {
      case 0:
        getData(authorization: CacheHelper.getData(key: 'token').toString());

        break;
      case 4:
        userProfile(
            authorization: CacheHelper.getData(key: 'token').toString());
        break;
    }

    emit(SuccessedChangeNav());
  }

  getAllSpecialization({required String authorization}) {
    appRepo
        .getAllSpecializations(authorization: authorization)
        .then(
          (value) => emit(
            SuccessedSpecializationState(
              specializationModel: value,
            ),
          ),
        )
        .catchError(
          (error) => emit(
            FailedSpecializationState(
              errorMessage: error.toString(),
            ),
          ),
        );
  }

  getData({required String authorization}) {
    appRepo
        .getHomeData(authorization: authorization)
        .then(
          (value) => emit(
            SuccessedHomeState(
              homeModel: value,
            ),
          ),
        )
        .catchError(
          (error) => emit(
            FailedHomeState(
              errorMessage: error.toString(),
            ),
          ),
        );
  }

  showDoc({required String authorization, required int id}) {
    appRepo
        .showDoc(authorization: authorization, id: id)
        .then((value) => emit(
              SuccessedShowDocState(
                doctorModel: value,
              ),
            ))
        .catchError(
      (error) {
        emit(
          FailedShowDocState(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }

  getAllDoctors({
    required String authorization,
  }) {
    appRepo
        .getAllDoctors(authorization: authorization)
        .then((value) => emit(
              SuccessedGetAllDocState(
                allDoctorModel: value,
              ),
            ))
        .catchError(
      (error) {
        emit(
          FailedGetAllDocState(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }

  searchDoc({
    required String authorization,
    required String name,
  }) {
    appRepo
        .searchDoc(authorization: authorization, name: name)
        .then(
          (value) => emit(
            SuccessedSearchDocState(
              doctorModel: value,
            ),
          ),
        )
        .catchError(
      (error) {
        emit(
          FailedSearchDocState(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }

  userProfile({
    required String authorization,
  }) {
    appRepo
        .userProfile(authorization: authorization)
        .then(
          (value) => emit(
            SuccessedUserProfileState(
              userModel: value,
            ),
          ),
        )
        .catchError(
      (error) {
        emit(
          FailedUserProfileState(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }

  updateUser(
      {required String authorization, required Map<String, dynamic> data}) {
    appRepo
        .updateProfile(authorization: authorization, data: data)
        .then(
          (value) => emit(
            SuccessedUserProfileUpdateState(
              userModel: value,
            ),
          ),
        )
        .catchError(
      (error) {
        emit(
          FailedUserProfileUpdateState(
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
}
