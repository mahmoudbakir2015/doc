import 'package:doc/constant/style.dart';
import 'package:doc/presentation/my_appointment/reschedule/items.dart';
import 'package:flutter/material.dart';
import '../../../constant/constants.dart';
import '../../../widgets/custom_bold_text.dart';
import '../../../widgets/custom_choose_container.dart';
import '../../../widgets/custom_choose_tile.dart';
import '../../../widgets/custom_list_tile.dart';
import '../../../widgets/custom_text_tile.dart';
import '../../../widgets/default_button.dart';
import '../details/details.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Styles.appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomListTile(
              text: 'Reschedule',
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: buildTextTile(
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
            ),
            Expanded(
              flex: 4,
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
                      listOfMonths: Constants.listOfMonths,
                      listOfDays: Constants.listOfDays,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: buildBoldText(text: 'Available time'),
            ),
            Expanded(
              flex: 9,
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
                  child: buildChoose(
                    index: index,
                    choose: chooseTime,
                    text: Constants.availableTime[index],
                  ),
                ),
                itemCount: Constants.availableTime.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: buildBoldText(text: 'Appointment Type'),
            ),
            Expanded(
              flex: 9,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {});
                      activeAppointment = index;
                    },
                    child: CustomChooseTile(
                      icon: Constants.appointmentType[index]['icon'].toString(),
                      text: Constants.appointmentType[index]['text'].toString(),
                      choose: index,
                      active: activeAppointment,
                    ),
                  );
                },
                itemCount: Constants.appointmentType.length,
              ),
            ),
            const Spacer(),
            DefaultButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RescheduleDetails(
                      bookDetails: {
                        'date':
                            '${selectedDate.weekday},${selectedDate.day} ${selectedDate.month} ${selectedDate.year}',
                        'available Time': Constants.availableTime[chooseTime],
                        'Appointment Type': Constants
                            .appointmentType[activeAppointment]['text'],
                      },
                    ),
                  ),
                );
                print(
                  {
                    'date': selectedDate,
                    'available Time': Constants.availableTime[chooseTime],
                    'Appointment Type':
                        Constants.appointmentType[activeAppointment]['text'],
                  },
                );
              },
              text: 'Reschedule',
            ),
          ],
        ),
      ),
    );
  }
}
