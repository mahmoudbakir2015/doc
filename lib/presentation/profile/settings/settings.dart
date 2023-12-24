import 'package:doc/constant/style.dart';
import 'package:doc/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant/assets.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Styles.appPadding),
            child: CustomListTile(
              text: 'Setting',
            ),
          ),
          buildSettingTile(
            icon: Assets.notification,
            name: 'Notification',
            onTap: () {},
          ),
          buildSettingTile(
            icon: Assets.faq,
            name: 'FAQ',
            onTap: () {},
          ),
          buildSettingTile(
            icon: Assets.security,
            name: 'Security',
            onTap: () {},
          ),
          buildSettingTile(
            icon: Assets.language,
            name: 'Language',
            onTap: () {},
          ),
          buildSettingTile(
            isLogout: true,
            icon: Assets.logout,
            name: 'Logout',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Padding buildSettingTile({
    required String icon,
    required String name,
    void Function()? onTap,
    bool isLogout = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: SvgPicture.asset(
          icon,
          color: !isLogout ? Colors.black : Colors.red,
        ),
        title: Text(
          name,
          style: TextStyle(
            color: !isLogout ? const Color(0xFF242424) : Colors.red,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: GestureDetector(
          onTap: onTap,
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
