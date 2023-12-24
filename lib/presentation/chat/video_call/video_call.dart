import 'package:doc/constant/style.dart';
import 'package:doc/presentation/chat/video_call/items.dart';
import 'package:flutter/material.dart';
import '../../../constant/assets.dart';

class VideoCall extends StatelessWidget {
  const VideoCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildYourImage(
            context: context,
            image: Assets.docImage,
          ),
          buildBack(context),
          buildHisImage(
            context: context,
            image: Assets.docImage,
          ),
          Positioned(
            bottom: Styles.appPadding + 10,
            left: Styles.appPadding,
            right: Styles.appPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildFooterButton(
                  icon: Assets.speaker,
                  onTap: () {},
                ),
                buildFooterButton(
                  icon: Assets.videoCall,
                  onTap: () {},
                ),
                buildFooterButton(
                  icon: Assets.mic,
                  onTap: () {},
                ),
                buildFooterButton(
                  isClose: true,
                  icon: Assets.phoneCall,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
