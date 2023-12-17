import 'package:doc/constant/style.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_list_tile.dart';
import '../../widgets/custom_search_filter.dart';
import '../../widgets/custom_text_tile.dart';

// ignore: must_be_immutable
class SearchView extends StatefulWidget {
  int itemCount = 4;
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            CustomListTile(
              text: 'Search',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.09,
            ),
            CustomSearchFilter(
              controller: search,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.09,
            ),
            buildTextTile(
              text: 'Recent Search',
              isSearch: true,
              onTap: () {
                widget.itemCount = 0;
                setState(() {});
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.01,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.access_time,
                    color: Color(0xFF9E9E9E),
                  ),
                  title: const Text(
                    'Dental',
                    style: TextStyle(
                      color: Color(0xFF9E9E9E),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      widget.itemCount--;
                      print(widget.itemCount);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 5,
                );
              },
              itemCount: widget.itemCount,
            ),
          ],
        ),
      ),
    );
  }
}
