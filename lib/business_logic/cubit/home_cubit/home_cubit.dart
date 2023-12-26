import 'package:doc/business_logic/cubit/home_cubit/home_states.dart';

import 'package:doc/data/repository/app_repo/app_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      // case 1:
      //   showDoc(authorization: CacheHelper.getData(key: 'token').toString(), id: );
      //   break;
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
}
