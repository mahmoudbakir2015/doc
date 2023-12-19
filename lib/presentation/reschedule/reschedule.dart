import 'package:doc/constant/style.dart';
import 'package:doc/presentation/reschedule/items.dart';
import 'package:flutter/material.dart';

import '../../constant/assets.dart';
import '../../widgets/custom_list_tile.dart';
import '../../widgets/custom_space.dart';
import '../../widgets/custom_text_tile.dart';
import '../../widgets/default_button.dart';

class Reschedule extends StatefulWidget {
  const Reschedule({super.key});

  @override
  State<Reschedule> createState() => _RescheduleState();
}

class _RescheduleState extends State<Reschedule> {
  int currentDateSelectedIndex = 0;

  int activeAppointment = 0;
  int chooseTime = 0;
  ScrollController scrollController = ScrollController();
  DateTime selectedDate = DateTime.now();

  List<String> listOfMonths = [
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

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  List<Map<String, String>> appointmentType = [
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
  List availableTime = [
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCustomSpace(context),
            CustomListTile(
              text: 'Reschedule',
            ),
            buildTextTile(
              mainText: 'Select Date',
              subText: 'Set Manual',
              onTap: () {
                setState(() {
                  currentDateSelectedIndex = 0;
                  activeAppointment = 0;
                  chooseTime = 0;
                });
              },
            ),
            Expanded(
              flex: 2,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 15);
                },
                itemCount: 365,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        currentDateSelectedIndex = index;
                        selectedDate =
                            DateTime.now().add(Duration(days: index));
                      });
                    },
                    child: buildDate(
                      index: index,
                      currentDateSelectedIndex: currentDateSelectedIndex,
                      listOfMonths: listOfMonths,
                      listOfDays: listOfDays,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: Styles.appPadding),
              child: buildBoldText(text: 'Available time'),
            ),
            Expanded(
              flex: 5,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3.5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    setState(() {});
                    chooseTime = index;
                  },
                  child: buildAvailbleTime(
                    index: index,
                    choose: chooseTime,
                    text: availableTime[index],
                  ),
                ),
                itemCount: availableTime.length,
              ),
            ),
            buildBoldText(text: 'Appointment Type'),
            Expanded(
              flex: 5,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {});
                      activeAppointment = index;
                    },
                    child: CustomChooseTile(
                      icon: appointmentType[index]['icon'].toString(),
                      text: appointmentType[index]['text'].toString(),
                      choose: index,
                      active: activeAppointment,
                    ),
                  );
                },
                itemCount: appointmentType.length,
              ),
            ),
            DefaultButton(
              onPressed: () {
                print(
                  {
                    'date': selectedDate,
                    'available Time': availableTime[chooseTime],
                    'Appointment Type': appointmentType[activeAppointment]
                        ['text'],
                  },
                );
              },
              text: 'Reschedule',
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
