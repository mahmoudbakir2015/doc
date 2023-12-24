import 'package:flutter/material.dart';
import '../../../../constant/style.dart';
import '../../../../widgets/custom_list_tile.dart';
import '../items.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Styles.appPadding),
            child: CustomListTile(
              isMain: false,
              text: 'Notification',
            ),
          ),
          SwitchIcon(
            text: 'Notification from DocNow',
            switchValue: _switchValue,
          ),
          SwitchIcon(
            text: 'Sound',
            switchValue: _switchValue,
          ),
          SwitchIcon(
            text: 'Vibrate',
            switchValue: _switchValue,
          ),
          SwitchIcon(
            text: 'App Updates',
            switchValue: _switchValue,
          ),
          SwitchIcon(
            text: 'Special Offers',
            switchValue: _switchValue,
          ),
        ],
      ),
    );
  }
}
