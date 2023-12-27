import 'package:doc/data/model/all_doc_model.dart';
import 'package:doc/data/model/doctor_model.dart';
import 'package:doc/data/model/home_model.dart';
import 'package:doc/data/model/user_model.dart';

import '../../../data/model/specialization_model.dart';

abstract class AppStates {}

class InitialHomeState extends AppStates {}

class SuccessedChangeNav extends AppStates {}

class SuccessedHomeState extends AppStates {
  final HomeModel homeModel;

  SuccessedHomeState({required this.homeModel});
}

class FailedHomeState extends AppStates {
  final String errorMessage;

  FailedHomeState({required this.errorMessage});
}

class SuccessedSpecializationState extends AppStates {
  final SpecializationModel specializationModel;

  SuccessedSpecializationState({required this.specializationModel});
}

class FailedSpecializationState extends AppStates {
  final String errorMessage;

  FailedSpecializationState({required this.errorMessage});
}

class SuccessedShowDocState extends AppStates {
  final DoctorModel doctorModel;

  SuccessedShowDocState({required this.doctorModel});
}

class FailedShowDocState extends AppStates {
  final String errorMessage;

  FailedShowDocState({required this.errorMessage});
}

class SuccessedGetAllDocState extends AppStates {
  final AllDoctorModel allDoctorModel;

  SuccessedGetAllDocState({required this.allDoctorModel});
}

class FailedGetAllDocState extends AppStates {
  final String errorMessage;

  FailedGetAllDocState({required this.errorMessage});
}

class SuccessedSearchDocState extends AppStates {
  final AllDoctorModel doctorModel;

  SuccessedSearchDocState({required this.doctorModel});
}

class FailedSearchDocState extends AppStates {
  final String errorMessage;

  FailedSearchDocState({required this.errorMessage});
}

class SuccessedUserProfileState extends AppStates {
  final UserModel userModel;

  SuccessedUserProfileState({required this.userModel});
}

class FailedUserProfileState extends AppStates {
  final String errorMessage;

  FailedUserProfileState({required this.errorMessage});
}

class SuccessedUserProfileUpdateState extends AppStates {
  final UserModel userModel;

  SuccessedUserProfileUpdateState({required this.userModel});
}

class FailedUserProfileUpdateState extends AppStates {
  final String errorMessage;

  FailedUserProfileUpdateState({required this.errorMessage});
}
