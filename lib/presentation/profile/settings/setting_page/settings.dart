import 'package:doc/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:doc/business_logic/cubit/auth_cubit/auth_states.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/core/cashe_helper.dart';
import 'package:doc/presentation/auth/login/login.dart';
import 'package:doc/presentation/profile/settings/faq/faq.dart';
import 'package:doc/presentation/profile/settings/setting_page/items.dart';
import 'package:doc/presentation/profile/settings/language/language.dart';
import 'package:doc/presentation/profile/settings/security/security.dart';
import 'package:doc/widgets/custom_bold_text.dart';
import 'package:doc/widgets/custom_list_tile.dart';
import 'package:doc/widgets/sub_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constant/assets.dart';
import '../notification_settings/notification_settings.dart';

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
              isMain: false,
              text: 'Setting',
            ),
          ),
          buildSettingTile(
            icon: Assets.notification,
            name: 'Notification',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationSetting(),
                ),
              );
            },
          ),
          buildSettingTile(
            icon: Assets.faq,
            name: 'FAQ',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Faq(),
                ),
              );
            },
          ),
          buildSettingTile(
            icon: Assets.security,
            name: 'Security',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Security(),
                ),
              );
            },
          ),
          buildSettingTile(
            icon: Assets.language,
            name: 'Language',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Languages(),
                ),
              );
            },
          ),
          BlocProvider(
            create: (context) => AuthCubit(),
            child: BlocConsumer<AuthCubit, AuthStates>(
              listener: (context, state) {
                if (state is LogoutSuccessed) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                      (route) => false);
                }
              },
              builder: (context, state) {
                AuthCubit cubit = AuthCubit.get(context);
                return buildSettingTile(
                  isLogout: true,
                  icon: Assets.logout,
                  name: 'Logout',
                  onTap: () {
                    showDialog(
                        context: (context),
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(50),
                            child: Center(
                              child: Card(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(Styles.appPadding),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      buildBoldText(text: 'Logout'),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: SizedBox(
                                          width: 200,
                                          child: SubText(
                                            text:
                                                '''You’ll need to enter your username and password next time you want to login''',
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          buildButtonDialog(
                                            text: 'Cancel',
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          buildButtonDialog(
                                            isLogout: true,
                                            text: 'Logout',
                                            onPressed: () {
                                              cubit.logOut(
                                                authorization:
                                                    CacheHelper.getData(
                                                            key: 'token')
                                                        .toString(),
                                              );
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  buildButtonDialog(
      {required String text,
      bool isLogout = false,
      required void Function() onPressed}) {
    return TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: !isLogout ? const Color(0xFF007AFF) : Colors.red,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ));
  }
}
