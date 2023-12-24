import 'package:doc/constant/assets.dart';

abstract class Constants {
  static const List<String> flags = [
    'assets/images/england.svg',
    'assets/images/america.svg',
    'assets/images/egypt.svg',
    'assets/images/palestine.svg'
  ];
  static List<Map> doctorSpeciality = [
    {
      'icon': Assets.general,
      'type': 'General',
    },
    {
      'icon': Assets.ent,
      'type': 'Ent',
    },
    {
      'icon': Assets.pediatric,
      'type': 'Pediatric',
    },
    {
      'icon': Assets.urologist,
      'type': 'Urologist',
    },
    {
      'icon': Assets.dentistry,
      'type': 'Dentistry',
    },
    {
      'icon': Assets.intestine,
      'type': 'Intestine',
    },
    {
      'icon': Assets.histologist,
      'type': 'Histologist',
    },
    {
      'icon': Assets.hepatology,
      'type': 'Hepatology',
    },
    {
      'icon': Assets.cardiologist,
      'type': 'cardiologist',
    },
    {
      'icon': Assets.neurologic,
      'type': 'Neurologic',
    },
    {
      'icon': Assets.pulmonary,
      'type': 'Pulmonary',
    },
    {
      'icon': Assets.optometry,
      'type': 'Optometry',
    },
  ];
  static List<String> languages = [
    'Arab',
    'English',
    'France',
    'Ghana',
    'Indonesia',
    'India',
    'Italia',
    'Japan',
    'Russia',
  ];
  static List availableTime = [
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
  ];
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
