import 'package:doc/data/model/home_model.dart';

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
