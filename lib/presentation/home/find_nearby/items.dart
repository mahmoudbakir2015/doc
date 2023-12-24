import 'package:flutter/material.dart';
import '../../../constant/style.dart';
import '../../../widgets/custom_search_filter.dart';
import '../../../widgets/doc_info.dart';

Padding buildSearch({
  required controller,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: Styles.appPadding,
      left: Styles.appPadding,
      right: Styles.appPadding,
    ),
    child: CustomSearchFilter(
      isMap: true,
      controller: controller,
    ),
  );
}

Positioned buildDocCard({
  required String name,
  required String description,
  required String type,
  required String rate,
  required String numReviews,
  void Function()? onTap,
}) {
  return Positioned(
    bottom: Styles.appPadding,
    left: Styles.appPadding,
    right: Styles.appPadding,
    child: SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildDocInfo(
              name: name,
              description: description,
              type: type,
              rate: rate,
              numReviews: numReviews,
            ),
          ),
        ),
      ),
    ),
  );
}

Container buildMap(BuildContext context) {
  return Container(
    color: Colors.grey,
    height: MediaQuery.of(context).size.height - 81,
    width: double.infinity,
    child: const Center(child: Text('Map')),
  );
}
