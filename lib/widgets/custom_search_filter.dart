import 'package:doc/constant/style.dart';
import 'package:doc/widgets/custom_bold_text.dart';
import 'package:doc/widgets/custom_choose.dart';
import 'package:doc/widgets/custom_space.dart';
import 'package:doc/widgets/custom_text_form.dart';
import 'package:doc/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/assets.dart';

class CustomSearchFilter extends StatefulWidget {
  const CustomSearchFilter({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<CustomSearchFilter> createState() => _CustomSearchFilterState();
}

class _CustomSearchFilterState extends State<CustomSearchFilter> {
  int specialityChoose = 0;
  int rating = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 14,
          child: defaultTextForm(
              widget: SvgPicture.asset(
                fit: BoxFit.scaleDown,
                Assets.search,
              ),
              label: 'Search',
              controller: widget.controller,
              onValidate: (String? value) {},
              textInputType: TextInputType.text),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(Styles.appPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Center(child: buildBoldText(text: 'Sort By')),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: buildBoldText(text: 'Speciality'),
                      ),
                      SizedBox(
                        height: 60,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {});
                                  specialityChoose = index;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SizedBox(
                                    width: 60,
                                    child: buildChoose(
                                      index: index,
                                      text: 'All',
                                      choose: specialityChoose,
                                    ),
                                  ),
                                ));
                          },
                          separatorBuilder: (ctx, index) {
                            return const SizedBox(
                              width: 20,
                            );
                          },
                          itemCount: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: buildBoldText(text: 'Rating'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          height: 60,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    rating = index;
                                  },
                                  child: SizedBox(
                                    width: 60,
                                    child: buildChoose(
                                      index: index,
                                      text: 'All',
                                      choose: rating,
                                      isRating: true,
                                    ),
                                  ));
                            },
                            separatorBuilder: (ctx, index) {
                              return const SizedBox(
                                width: 20,
                              );
                            },
                            itemCount: 10,
                          ),
                        ),
                      ),
                      buildCustomSpace(context),
                      DefaultButton(onPressed: () {}, text: 'Done'),
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(
            Icons.filter_list,
          ),
        ),
      ],
    );
  }
}
