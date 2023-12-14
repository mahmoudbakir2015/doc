import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/assets.dart';
import '../../constant/style.dart';
import '../../widgets/custom_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF247CFF),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            right: 0,
            left: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Styles.appPadding),
              child: CustomListTile(
                text: 'My Appointment',
                trailing: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    Assets.setting,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height - 200,
              color: Colors.white,
            ),
          ),
          const Positioned(
              top: 200 - 60,
              right: 0,
              left: 0,
              child: CircleAvatar(
                radius: 60,
              )),
          const Positioned(
              top: 200 - 50,
              right: 0,
              left: 0,
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 50,
                child: Center(
                  child: Image(image: NetworkImage(Assets.docImage)),
                ),
              )),
        ],
      ),
    );
  }
}
