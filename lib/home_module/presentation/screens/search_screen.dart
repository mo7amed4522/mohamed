import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/home_module/presentation/controller/home_cubit.dart';
import 'package:mohamed/login_module/presentation/component/component.dart';
import 'package:sizer/sizer.dart';
import 'edite_screen.dart';
import 'occupations_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(
              0xFF3F4048,
            ),
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Column(
                children: [
                  defaultTextForm(
                    color: Colors.white,
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    label: 'Search',
                    prefix: Icons.search,
                    onChange: (String text) {
                      HomeCubit.get(context).searchajax(
                        name: text,
                      );
                    },
                    onTap: () {},
                    onSubmit: (String text) {
                      HomeCubit.get(context).searchajax(
                        name: text,
                      );
                    },
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'enter text to search';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  if (state is SearchLoadingState)
                    const LinearProgressIndicator(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  if (state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                20.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsetsDirectional.all(
                            8.0,
                          ),
                          margin: const EdgeInsets.only(
                            top: 20.0,
                          ),
                          alignment: Alignment.center,
                          child: MaterialButton(
                            onPressed: () {
                              HomeCubit.get(context).getFile(
                                  HomeCubit.get(context)
                                      .searchData!
                                      .data[index]
                                      .id!);
                              idOccupation2 = HomeCubit.get(context)
                                  .searchData!
                                  .data[index]
                                  .idOccupation!;
                              HomeCubit.get(context).getFilesData(
                                  idOccupation: HomeCubit.get(context)
                                      .searchData!
                                      .data[index]
                                      .idOccupation!);
                              HomeCubit.get(context).goToFolder(
                                  HomeCubit.get(context)
                                      .searchData!
                                      .data[index]
                                      .id!);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const EditeScreen(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(
                                25.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'الاسم : ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        HomeCubit.get(context)
                                            .searchData!
                                            .data[index]
                                            .nameFacility!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'رقم الملف : ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        HomeCubit.get(context)
                                            .searchData!
                                            .data[index]
                                            .number!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'المالك  : ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        HomeCubit.get(context)
                                            .searchData!
                                            .data[index]
                                            .owner!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 20.0,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 1.0,
                            color: Colors.grey[300],
                          ),
                        ),
                        itemCount:
                            HomeCubit.get(context).searchData!.data.length,
                      ),
                    ),
                  if (state is SearchErrorState)
                    Expanded(
                      child: Center(
                        child: Text(
                          'لا يوجد منشأه بهذا الاسم',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
