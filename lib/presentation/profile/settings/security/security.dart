import 'package:doc/presentation/profile/settings/items.dart';
import 'package:flutter/material.dart';

import '../../../../constant/style.dart';
import '../../../../widgets/custom_list_tile.dart';

class Security extends StatelessWidget {
  const Security({super.key});

  @override
  Widget build(BuildContext context) {
    bool _switchValue = true;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Styles.appPadding),
            child: CustomListTile(
              isMain: false,
              text: 'Security',
            ),
          ),
          SwitchIcon(text: 'Remember password', switchValue: _switchValue),
          SwitchIcon(text: 'Face ID', switchValue: _switchValue),
          SwitchIcon(text: 'PIN', switchValue: _switchValue),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {},
              child: const ListTile(
                leading: Text(
                  'Google Authenticator',
                  style: TextStyle(
                    color: Color(0xFF242424),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          )
        ],
      ),
    );
  }
}
