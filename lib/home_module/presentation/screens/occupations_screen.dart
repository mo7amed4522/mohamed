import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/home_module/presentation/controller/home_cubit.dart';
import 'package:mohamed/home_module/presentation/screens/add_occupations_screen.dart';
import 'package:mohamed/home_module/presentation/screens/edite_screen.dart';
import 'package:mohamed/home_module/presentation/screens/place_screen.dart';
import 'package:mohamed/home_module/presentation/screens/search_screen.dart';
import 'package:mohamed/login_module/presentation/component/component.dart';
import 'package:sizer/sizer.dart';

late int idOccupation2;

class OccupationsScreen extends StatelessWidget {
  const OccupationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var occupationController = TextEditingController();
    var updateController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    var formKey2 = GlobalKey<FormState>();
    return Sizer(
      builder: (
        context,
        orientation,
        deviceType,
      ) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: const Color(
              0xFF313232,
            ),
            leading: IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SearchScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_forward,
                ),
              ),
            ],
          ),
          body: Form(
            key: formKey,
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Container(
                  color: const Color(
                    0xFF3F4048,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    width: 50.w,
                                    margin: const EdgeInsetsDirectional.all(
                                      30.0,
                                    ),
                                    padding: const EdgeInsetsDirectional.all(
                                      10.0,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF313232),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          10.0,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'اشغالات $namePlace ',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Container(
                                    margin: const EdgeInsetsDirectional.all(
                                      20.0,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0,
                                      vertical: 5.0,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Color(
                                        0xFF1C30E0,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          10.0,
                                        ),
                                      ),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          HomeCubit.get(context)
                                              .insertOccupation(
                                                  name:
                                                      occupationController.text,
                                                  idPlace: idPlace2);
                                          occupationController.text = '';
                                        }
                                      },
                                      child: Text(
                                        'اضافه',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Container(
                                    width: 80.w,
                                    margin: const EdgeInsetsDirectional.all(
                                      20.0,
                                    ),
                                    padding: const EdgeInsetsDirectional.all(
                                      10.0,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Color(
                                        0xFF313232,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          10.0,
                                        ),
                                      ),
                                    ),
                                    child: defaultTextForm(
                                      color: Colors.white,
                                      controller: occupationController,
                                      keyboardType: TextInputType.text,
                                      label: 'اشغال جديد',
                                      prefix: Icons.ac_unit,
                                      onTap: () {},
                                      onChange: (value) {},
                                      onSubmit: (value) {
                                        if (formKey.currentState!.validate()) {
                                          HomeCubit.get(context)
                                              .insertOccupation(
                                                  name:
                                                      occupationController.text,
                                                  idPlace: idPlace2);
                                          occupationController.text = '';
                                        }
                                      },
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'ادخل اسم الاشغاله الجديده';
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsetsDirectional.all(
                                    30.sp,
                                  ),
                                  padding: EdgeInsets.all(
                                    10.sp,
                                  ),
                                  child: ConditionalBuilder(
                                    condition:
                                        HomeCubit.get(context).occupation !=
                                            null,
                                    builder: (context) => GridView.count(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 3.h,
                                      crossAxisSpacing: 10.w,
                                      childAspectRatio: 1 / 0.6,
                                      children: List.generate(
                                        HomeCubit.get(context)
                                            .occupation!
                                            .data
                                            .length,
                                        (index) => Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(
                                                40.sp,
                                              ),
                                              bottom: Radius.circular(
                                                10.sp,
                                              ),
                                            ),
                                            color: const Color(
                                              0xFF313232,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                child: Text(
                                                  HomeCubit.get(context)
                                                      .occupation!
                                                      .data[index]
                                                      .name!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  idOccupation2 =
                                                      HomeCubit.get(context)
                                                          .occupation!
                                                          .data[index]
                                                          .id!;
                                                  HomeCubit.get(context).f =
                                                      null;
                                                  HomeCubit.get(context)
                                                      .getFilesData(
                                                    idOccupation: idOccupation2,
                                                  );
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          const EditeScreen(),
                                                    ),
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  MaterialButton(
                                                    onPressed: () {
                                                      idOccupation2 =
                                                          HomeCubit.get(context)
                                                              .occupation!
                                                              .data[index]
                                                              .id!;
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              const AddOccupationScreen(),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      'اضافه',
                                                      style: TextStyle(
                                                        color: const Color(
                                                          0xFF1C30E0,
                                                        ),
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  MaterialButton(
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                                context) =>
                                                            AlertDialog(
                                                          title: const Text(
                                                              'تعديل'),
                                                          content: Form(
                                                            key: formKey2,
                                                            child: Container(
                                                              width: 50.w,
                                                              margin:
                                                                  const EdgeInsetsDirectional
                                                                      .all(
                                                                20.0,
                                                              ),
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .all(
                                                                10.0,
                                                              ),
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                    10.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              child:
                                                                  defaultTextForm(
                                                                color: Colors
                                                                    .black,
                                                                controller:
                                                                    updateController,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                label:
                                                                    'تعديل الاسم',
                                                                prefix:
                                                                    Icons.edit,
                                                                onTap: () {},
                                                                onChange:
                                                                    (value) {},
                                                                onSubmit:
                                                                    (value) {},
                                                                validate:
                                                                    (String?
                                                                        value) {
                                                                  if (value!
                                                                      .isEmpty) {
                                                                    return ' ادخل اسم الاشغاله الجديد';
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      context,
                                                                      'Cancel'),
                                                              child: const Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                if (formKey2
                                                                    .currentState!
                                                                    .validate()) {
                                                                  idOccupation2 = HomeCubit
                                                                          .get(
                                                                              context)
                                                                      .occupation!
                                                                      .data[
                                                                          index]
                                                                      .id!;
                                                                  HomeCubit.get(
                                                                          context)
                                                                      .f = null;
                                                                  HomeCubit.get(
                                                                          context)
                                                                      .updateOccupation(
                                                                          id:
                                                                              idOccupation2,
                                                                          name:
                                                                              updateController.text);
                                                                  updateController
                                                                      .text = "";
                                                                  return Navigator
                                                                      .pop(
                                                                          context,
                                                                          'ok');
                                                                }
                                                              },
                                                              child: const Text(
                                                                  'OK'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      'تعديل',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    fallback: (context) => Center(
                                      child: Text(
                                        'لا توجد اشغالات',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
