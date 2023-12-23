import 'package:ui/data/model/carMake_model.dart';
import 'package:ui/data/model/countries_model.dart';
import 'package:ui/data/model/offer_model.dart';
import 'package:ui/data/model/package_model.dart';
import 'package:ui/data/model/sos_model.dart';
import 'package:ui/data/model/trip_model.dart';
import 'package:ui/data/web_services/appWebService.dart';

import '../model/allOrder_model.dart';
import '../model/subscription_model.dart';

class AppRepo {
  AppWebService appWebService;
  AppRepo({required this.appWebService});
  Future<AllOrderModel> getAllOrders() async {
    return AllOrderModel.fromJson(await appWebService.getAllOrders());
  }

  Future<CarMakeModel> getAllCars() async {
    return CarMakeModel.fromJson(await appWebService.getAllCar());
  }

  Future<OfferModel> getAllOffers() async {
    return OfferModel.fromJson(await appWebService.getAllOffers());
  }

  Future<SubscriptionModel> getAllSubscription() async {
    return SubscriptionModel.fromJson(await appWebService.getAllSubscription());
  }

  Future<PackageModel> getAllPackages() async {
    return PackageModel.fromJson(await appWebService.getAllPackages());
  }

  Future<CountriesModel> getAllCountries() async {
    return CountriesModel.fromJson(await appWebService.getAllCountries());
  }

  Future<TripTypeModel> getAllTripType() async {
    return TripTypeModel.fromJson(await appWebService.getAllTripType());
  }

  Future<SosModel> getAllSos() async {
    return SosModel.fromJson(await appWebService.getAllSos());
  }
}
