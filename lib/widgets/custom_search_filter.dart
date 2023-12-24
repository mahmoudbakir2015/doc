// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:doc/constant/style.dart';
import 'package:doc/widgets/custom_bold_text.dart';
import 'package:doc/widgets/custom_choose_container.dart';
import 'package:doc/widgets/custom_space.dart';
import 'package:doc/widgets/default_button.dart';

import '../constant/assets.dart';

// ignore: must_be_immutable
class CustomSearchFilter extends StatefulWidget {
  bool isMap;
  CustomSearchFilter({
    Key? key,
    this.isMap = false,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<CustomSearchFilter> createState() => _CustomSearchFilterState();
}

class _CustomSearchFilterState extends State<CustomSearchFilter> {
  int specialityChoose = 0;
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            flex: 14,
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: SvgPicture.asset(
                  color: Colors.grey,
                  Assets.search,
                  fit: BoxFit.scaleDown,
                ),
                fillColor:
                    widget.isMap ? Colors.white : const Color(0xFFF2F4F7),
                filled: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      Styles.appPadding,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Scaffold(
                    body: Padding(
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
                                      specialityChoose = index;
                                      setState(() {});
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
                                    ),
                                  );
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
                          DefaultButton(
                            onPressed: () {},
                            text: 'Done',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: const Icon(
                Icons.filter_list,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
