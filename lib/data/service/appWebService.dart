// import 'package:dio/dio.dart';
// import 'package:ui/constant/endPoint.dart';
// import 'package:ui/core/dio_helper.dart';

// class AppWebService {
//   Future<dynamic> getAllOrders() async {
//     Response response = await DioHelper.getData(
//       endPoint: EndPoint.allOrder,
//     );
//     try {
//       print(response.data.toString());
//       return response.data;
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   /////////////////////////////////////////////////////////

//   Future<dynamic> getAllCountries() async {
//     try {
//       Response response = await DioHelper.getData(endPoint: EndPoint.countries);
//       print(response.data.toString());
//       return response.data;
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<dynamic> getAllCar() async {
//     Response response = await DioHelper.getData(endPoint: EndPoint.carMake);
//     try {
//       print(response.data.toString());
//       return response.data;
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<dynamic> getAllSubscription() async {
//     Response response =
//         await DioHelper.getData(endPoint: EndPoint.subscription);
//     try {
//       print(response.data.toString());
//       return response.data;
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<dynamic> getAllSos() async {
//     Response response = await DioHelper.getData(endPoint: EndPoint.sos);
//     try {
//       print(response.data.toString());
//       return response.data;
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<dynamic> getAllOffers() async {
//     Response response = await DioHelper.getData(endPoint: EndPoint.offers);
//     try {
//       print(response.data.toString());
//       return response.data;
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<dynamic> getAllPackages() async {
//     Response response = await DioHelper.getData(endPoint: EndPoint.packages);
//     try {
//       print(response.data.toString());
//       return response.data;
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<dynamic> getAllTripType() async {
//     try {
//       Response response = await DioHelper.getData(endPoint: EndPoint.tripType);
//       print(response.data.toString());
//       return response.data;
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
