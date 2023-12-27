import 'package:doc/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:doc/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:doc/business_logic/cubit/home_cubit/home_states.dart';
import 'package:doc/constant/constants.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/core/cashe_helper.dart';
import 'package:doc/data/model/user_model.dart';
import 'package:doc/presentation/main_screen/main_screen.dart';
import 'package:doc/presentation/profile/personal_information/items.dart';
import 'package:doc/widgets/custom_list_tile.dart';
import 'package:doc/widgets/custom_space.dart';
import 'package:doc/widgets/default_button.dart';
import 'package:doc/widgets/sub_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/custom_phone_form.dart';

class PersonalInformation extends StatelessWidget {
  final UserModel userModel;
  const PersonalInformation({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is SuccessedUserProfileUpdateState) {
            AppCubit cubit = AppCubit.get(context);
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => MainScreen(
                  token: CacheHelper.getData(key: 'token').toString(),
                ),
              ),
              (route) => false,
            );
            cubit.currentIndex = 0;
          } else if (state is FailedUserProfileUpdateState) {
            AuthCubit cubit = AuthCubit.get(context);
            print(
                '=======================================> ${state.errorMessage}');
            cubit.buildToast(
              msg: state.errorMessage,
              state: ToastStates.error,
            );
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          cubit.name.text = userModel.data![0].name.toString();
          cubit.email.text = userModel.data![0].email.toString();
          cubit.password.text = 'password';
          cubit.phone.text = userModel.data![0].phone.toString();
          return Padding(
            padding: const EdgeInsets.only(
              top: Styles.appPadding,
              left: Styles.appPadding,
              right: Styles.appPadding,
            ),
            child: Form(
              key: cubit.formKey,
              child: ListView(
                children: [
                  CustomListTile(
                    isMain: false,
                    back: () {
                      Navigator.pop(context);
                      cubit.changeNav(tap: 4);
                    },
                    text: 'Personal information',
                  ),
                  buildCustomSpace(context),
                  buildEditPic(
                    context: context,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  buildEditForm(
                    controller: cubit.name,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "this field shouldn't be empty";
                      } else if (value.length < 3) {
                        return "Your number  should be greater than 2 nums";
                      } else {
                        return null;
                      }
                    },
                  ),
                  buildEditForm(
                    controller: cubit.email,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "this field shouldn't be empty";
                      } else if (!value.contains('@') &&
                          !value.contains('.com')) {
                        return "this is not email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  buildEditForm(
                    controller: cubit.password,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "this field shouldn't be empty";
                      } else if (value.length < 8) {
                        return "Your number  should be greater than 7 nums";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: PhoneForm(
                      selectedFlag: Constants.flags[2],
                      flags: Constants.flags,
                      phone: cubit.phone,
                    ),
                  ),
                  const SubText(
                      text:
                          '''When you set up your personal information settings, you should take care to provide accurate information.'''),
                  const Spacer(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: Styles.appPadding),
                    child: DefaultButton(
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.updateUser(
                            authorization:
                                CacheHelper.getData(key: 'token').toString(),
                            data: {
                              'name': cubit.name.text,
                              'email': cubit.email.text,
                              'phone': cubit.phone.text,
                              'gender': "0",
                              'password': cubit.password.text,
                              'password_confirmation': cubit.password.text,
                            },
                          );
                        }
                      },
                      text: 'Save',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
