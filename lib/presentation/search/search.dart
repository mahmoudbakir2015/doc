import 'package:doc/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:doc/business_logic/cubit/home_cubit/home_states.dart';
import 'package:doc/constant/style.dart';
import 'package:doc/presentation/home/doctor_page/doctor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_list_tile.dart';
import '../../widgets/custom_search_filter.dart';
import '../../widgets/custom_text_tile.dart';
import '../../widgets/doc_info.dart';

// ignore: must_be_immutable
class SearchView extends StatefulWidget {
  final String token;
  int itemCount = 4;
  SearchView({super.key, required this.token});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();

    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: Styles.appPadding),
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
                onChanged: (String? value) {
                  cubit.searchDoc(
                    authorization: widget.token,
                    name: value.toString(),
                  );
                },
                controller: search,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.09,
              ),
              buildTextTile(
                mainText: 'Recent Search',
                onTap: () {
                  widget.itemCount = 0;
                  setState(() {});
                },
                subText: 'Clear All History',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              (state is SuccessedSearchDocState)
                  ? Expanded(
                      child: ListView.separated(
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DoctorPage(
                                    id: state.doctorModel.data![index].id!
                                        .toInt(),
                                    token: widget.token,
                                  ),
                                ),
                              );
                            },
                            child: buildDocInfo(
                              docPhoto: state.doctorModel.data![index].photo
                                  .toString(),
                              name: state.doctorModel.data![index].name
                                  .toString(),
                              description: state.doctorModel.data![index].degree
                                  .toString(),
                              type: state
                                  .doctorModel.data![index].specialization!.name
                                  .toString(),
                              rate: (state
                                      .doctorModel.data![index].appointPrice!
                                      .toInt())
                                  .toString(),
                              numReviews: state
                                  .doctorModel.data![index].appointPrice
                                  .toString(),
                            ),
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: state.doctorModel.data!.length,
                      ),
                    )
                  : ListView.separated(
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
        );
      },
    );
  }
}
