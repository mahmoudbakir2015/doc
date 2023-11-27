import 'package:doc/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class PhoneForm extends StatefulWidget {
  String selectedFlag;
  final TextEditingController phone;
  final List<String> flags;
  PhoneForm(
      {super.key,
      required this.selectedFlag,
      required this.flags,
      required this.phone});

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  @override
  Widget build(BuildContext context) {
    return defaultTextForm(
      flag: DropdownButton<String>(
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        value: widget.selectedFlag,
        onChanged: (newValue) {
          setState(
            () {
              widget.selectedFlag = newValue!;
            },
          );
        },
        items: widget.flags.map((String flag) {
          return DropdownMenuItem<String>(
            value: flag,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                flag,
                width: 50,
              ),
            ),
          );
        }).toList(),
      ),
      notMobile: false,
      label: 'Phone',
      controller: widget.phone,
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
    );
  }
}
