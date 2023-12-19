import 'package:doc/constant/assets.dart';

abstract class Constants {
  static List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  static List<String> listOfDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];

  static List<Map<String, String>> appointmentType = [
    {
      'icon': Assets.person,
      'text': 'In person',
    },
    {
      'icon': Assets.videoCall,
      'text': 'Video Call',
    },
    {
      'icon': Assets.phoneCall,
      'text': 'Phone Call',
    },
  ];
}
