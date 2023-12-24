import 'package:doc/constant/constants.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/presentation/profile/personal_information/items.dart';
import 'package:doc/widgets/custom_list_tile.dart';
import 'package:doc/widgets/custom_space.dart';
import 'package:doc/widgets/default_button.dart';
import 'package:doc/widgets/sub_text.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_phone_form.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController phone = TextEditingController();
    name.text = 'mahmoudbakir';
    email.text = 'mahmoud@gmail.com';
    password.text = 'password';
    phone.text = '+201017632363';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Styles.appPadding),
        child: Form(
          child: Column(
            children: [
              CustomListTile(
                isMain: false,
                text: 'Personal information',
              ),
              buildCustomSpace(context),
              buildEditPic(
                onTap: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              buildEditForm(
                controller: name,
                validator: (String? value) {},
              ),
              buildEditForm(
                controller: email,
                validator: (String? value) {},
              ),
              buildEditForm(
                controller: password,
                validator: (String? value) {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: PhoneForm(
                  selectedFlag: Constants.flags[2],
                  flags: Constants.flags,
                  phone: phone,
                ),
              ),
              const SubText(
                  text:
                      '''When you set up your personal information settings, you should take care to provide accurate information.'''),
              const Spacer(),
              DefaultButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                text: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
