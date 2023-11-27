// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:doc/widgets/custom_text_form.dart';

import '../constant/assets.dart';
import '../constant/style.dart';

// ignore: must_be_immutable
class FormSheet extends StatefulWidget {
  bool isLogined;
  TextEditingController? phone;
  final GlobalKey<FormState> formKey;
  final TextEditingController email;
  final TextEditingController password;
  FormSheet({
    Key? key,
    this.isLogined = true,
    this.phone,
    required this.formKey,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  State<FormSheet> createState() => _FormSheetState();
}

class _FormSheetState extends State<FormSheet> {
  List<String> flags = [
    Assets.apple,
    Assets.england,
    Assets.facebook,
    Assets.google,
  ];
  String selectedFlag = Assets.england;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          defaultTextForm(
            label: 'Email',
            controller: widget.email,
            textInputType: TextInputType.emailAddress,
            iconData: Icons.email,
            onValidate: (String? value) {
              if (value!.isEmpty) {
                return "this field shouldn't be empty";
              } else if (!value.contains('@')) {
                return "this field is not mail";
              } else if (!value.contains('.com')) {
                return "this field is not mail";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          defaultTextForm(
            label: 'password',
            controller: widget.password,
            textInputType: TextInputType.emailAddress,
            iconData: Icons.password,
            onValidate: (String? value) {
              if (value!.isEmpty) {
                return "this field shouldn't be empty";
              } else if (value.length < 8) {
                return "this field should be greater  8 nums";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          !widget.isLogined
              ? defaultTextForm(
                  flag: Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      left: 8,
                      bottom: 8,
                      right: Styles.appPadding,
                    ),
                    child: DropdownButton<String>(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      value: selectedFlag,
                      onChanged: (newValue) {
                        setState(
                          () {
                            selectedFlag = newValue!;
                          },
                        );
                      },
                      items: flags.map((String language) {
                        return DropdownMenuItem<String>(
                          value: language,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(language),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  notMobile: false,
                  label: 'Phone',
                  controller: widget.phone!,
                  textInputType: TextInputType.phone,
                  iconData: Icons.phone,
                  onValidate: (String? value) {
                    if (value!.isEmpty) {
                      return "this field shouldn't be empty";
                    } else if (value.length < 11) {
                      return "Your number  should be greater than 11 nums";
                    } else {
                      return null;
                    }
                  },
                )
              : const SizedBox(
                  height: 0,
                ),
        ],
      ),
    );
  }
}
