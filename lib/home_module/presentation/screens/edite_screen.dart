import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/home_module/presentation/screens/home_screen.dart';
import 'package:mohamed/home_module/presentation/screens/occupations_screen.dart';
import 'package:mohamed/home_module/presentation/screens/place_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:mohamed/core/func/sell_execute_services.dart';
import 'package:mohamed/home_module/presentation/controller/home_cubit.dart';
import 'package:mohamed/home_module/presentation/screens/search_screen.dart';
import '../../../core/func/filePicker.dart';
import '../../../login_module/presentation/component/component.dart';
import 'add_occupations_screen.dart';
class EditeScreen extends StatelessWidget {
  const EditeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (
      context,
      orientation,
      deviceType,
    ) {
      var formKey = GlobalKey<FormState>();

      var cubit = HomeCubit.get(context);

      return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(
                0xFF313232,
              ),
              elevation: 0.0,
              centerTitle: true,
              leading: IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (
                        BuildContext context,
                      ) =>
                          const SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              actions: [
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    if( HomeCubit.get(context).facilities == null){
                      HomeCubit.get(context).deleteOccupation(id: idOccupation2, idRegion: idRegion2, idPlace: idPlace2);
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                  ),
                ),
              ],
              title: Text(
                'الاشغالات ',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: const Color(
              0xFF3F4048,
            ),
            body: Form(
              key: formKey,
              child: Container(
                padding: EdgeInsetsDirectional.all(
                  5.sp,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ConditionalBuilder(
                        condition: HomeCubit.get(context).f != null,
                        builder: (context) => SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'اسم المنشأة',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(
                                            left: 10.w,
                                          ),
                                          child: defaultTextForm(
                                            color: Colors.white,
                                            controller: cubit.facilityName,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            label: '',
                                            prefix: Icons.house_siding_outlined,
                                            onSubmit: (value) {},
                                            onChange: (value) {},
                                            onTap: () {},
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'ادخل اسم المنشأة';
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'العنوان',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(
                                            left: 10.w,
                                          ),
                                          child: defaultTextForm(
                                            color: Colors.white,
                                            controller: cubit.address,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            label: '',
                                            prefix: Icons.location_city_sharp,
                                            onSubmit: (value) {},
                                            onChange: (value) {},
                                            onTap: () {},
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'ادخل العنوان';
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'رقم الملف',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(
                                            left: 10.w,
                                          ),
                                          child: defaultTextForm(
                                            color: Colors.white,
                                            controller: cubit.cellNumber,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            label: '',
                                            prefix: Icons.numbers_rounded,
                                            onSubmit: (value) {},
                                            onChange: (value) {},
                                            onTap: () {},
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'ادخل رقم الخانه';
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'اسم المالك',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(left: 10.w),
                                          child: defaultTextForm(
                                            color: Colors.white,
                                            controller: cubit.ownerName,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            label: '',
                                            prefix: Icons.person_rounded,
                                            onSubmit: (value) {},
                                            onChange: (value) {},
                                            onTap: () {},
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'ادخل اسم المالك';
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'رقم الهاتف',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(
                                            left: 10.w,
                                          ),
                                          child: defaultTextForm(
                                            color: Colors.white,
                                            controller: cubit.phone,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            label: '',
                                            prefix: Icons.phone_android_rounded,
                                            onSubmit: (value) {},
                                            onChange: (value) {},
                                            onTap: () {},
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'ادخل اسم المالك';
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: .5.h,
                              ),
                              Text(
                                'الرقم القومى',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                ),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                  left: 10.w,
                                ),
                                child: defaultTextForm(
                                  color: Colors.white,
                                  controller: cubit.nationalID,
                                  keyboardType: TextInputType.emailAddress,
                                  label: '',
                                  prefix: Icons.iso_rounded,
                                  onSubmit: (value) {},
                                  onChange: (value) {},
                                  onTap: () {},
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل اسم المالك';
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (
                                          BuildContext context,
                                        ) =>
                                            AlertDialog(
                                          title: const Text('اختار'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Fun().pickFile1();

                                                Navigator.pop(
                                                  context,
                                                  'Cancel',
                                                );
                                              },
                                              child: const Text(
                                                'add file or photo',
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                String path =
                                                    HomeCubit.get(context)
                                                        .path!
                                                        .path!;
                                                ShellExecuteService()
                                                    .openDirectory(
                                                  'D:/xampp/htdocs/windows_app/upload/$path',
                                                );
                                                return Navigator.pop(
                                                  context,
                                                  'ok',
                                                );
                                              },
                                              child: const Text(
                                                'show file',
                                              ),
                                            ),
                                          ],
                                        ),
                                      );

                                      // print(file.path);
                                    },
                                    icon: Icon(
                                      Icons.wordpress,
                                      size: 8.w,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (
                                            BuildContext context,
                                          ) =>
                                              AlertDialog(
                                            title: const Text(
                                              'اختار',
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Fun().pickFile2();
                                                  if (img != null) {
                                                    HomeCubit.get(
                                                      context,
                                                    ).uploadFile(img!);
                                                  }
                                                  Navigator.pop(
                                                    context,
                                                    'Cancel',
                                                  );
                                                },
                                                child: const Text(
                                                  'add file or photo',
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  String path = HomeCubit.get(
                                                    context,
                                                  ).path!.path!;
                                                  ShellExecuteService()
                                                      .openDirectory(
                                                    'D:/xampp/htdocs/windows_app/upload/$path',
                                                  );
                                                  return Navigator.pop(
                                                    context,
                                                    'ok',
                                                  );
                                                },
                                                child: const Text(
                                                  'show file',
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.camera,
                                        size: 8.w,
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (
                                            BuildContext context,
                                          ) =>
                                              AlertDialog(
                                            title: const Text(
                                              'اختار',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Fun().pickFile3();
                                                  if (s != null) {
                                                    HomeCubit.get(
                                                      context,
                                                    ).uploadFile(s!);
                                                  }
                                                  Navigator.pop(
                                                    context,
                                                    'Cancel',
                                                  );
                                                },
                                                child: const Text(
                                                  'add file or photo',
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  String path =
                                                      HomeCubit.get(context)
                                                          .path!
                                                          .path!;
                                                  ShellExecuteService()
                                                      .openDirectory(
                                                    'D:/xampp/htdocs/windows_app/upload/$path',
                                                  );
                                                  return Navigator.pop(
                                                      context, 'ok');
                                                },
                                                child: const Text(
                                                  'show file',
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.scanner,
                                        size: 8.w,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              //غير مستوفى و مستوفى
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: const Color(
                                                0xFF1C30E0,
                                              ),
                                              value: 0,
                                              groupValue:
                                                  HomeCubit.get(context).num,
                                              onChanged: (value) {
                                                HomeCubit.get(context)
                                                    .changeRadioBox(
                                                  value: 0,
                                                );
                                              }),
                                          Text(
                                            'مستوفى',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: const Color(
                                                0xFF1C30E0,
                                              ),
                                              value: 1,
                                              groupValue:
                                                  HomeCubit.get(context).num,
                                              onChanged: (value) {
                                                HomeCubit.get(context)
                                                    .changeRadioBox(
                                                  value: 1,
                                                );
                                              }),
                                          Text(
                                            'غير مستوفى',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                        left: 10.w,
                                      ),
                                      child: defaultTextForm(
                                        color: Colors.white,
                                        controller: cubit.fulfilled,
                                        keyboardType: TextInputType.datetime,
                                        label: ' موعد الاستلام',
                                        prefix: Icons.date_range_outlined,
                                        onSubmit: (value) {},
                                        onChange: (value) {},
                                        onTap: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate:
                                                DateTime.parse('1000-10-10'),
                                            lastDate:
                                                DateTime.parse('3050-12-10'),
                                          ).then((value) {
                                            if (HomeCubit.get(context).num ==
                                                0) {
                                              cubit.num = value!.month + 12;
                                            } else {
                                              cubit.num = value!.month + 3;
                                            }
                                            cubit.datetime1 = DateTime(
                                                value.year,
                                                value.month,
                                                value.day);
                                            cubit.fulfilled.text = value
                                                .toString()
                                                .substring(0, 10);
                                            cubit.datetime2 = DateTime(
                                                value.year,
                                                cubit.num,
                                                value.day);
                                            if (kDebugMode) {
                                              print(
                                                cubit.datetime2,
                                              );
                                            }
                                            cubit.reFulfilled.text = cubit
                                                .datetime2
                                                .toString()
                                                .substring(0, 10);
                                          });
                                        },
                                        validate: (String value) {
                                          if (value.isEmpty) {
                                            return 'date must be not empty';
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: 10.w),
                                      child: defaultTextForm(
                                        color: Colors.white,
                                        controller: cubit.reFulfilled,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        label: 'موعد الانتهاء',
                                        readOnly: true,
                                        prefix: Icons.timer_outlined,
                                        onSubmit: (value) {},
                                        onChange: (value) {},
                                        onTap: () {},
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'Email must be not empty';
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 20.w,
                                    decoration: const BoxDecoration(
                                      color: Color(
                                        0xFF1C30E0,
                                      ),
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
                                        if (formKey.currentState!.validate()) {
                                          if (w != null) {
                                            HomeCubit.get(context)
                                                .uploadFile(w!);
                                          }
                                          if (img != null) {
                                            HomeCubit.get(context)
                                                .uploadFile(img!);
                                          }
                                          if (s != null) {
                                            HomeCubit.get(context)
                                                .uploadFile(s!);
                                          }

                                          HomeCubit.get(context).updateFile();
                                        }
                                      },
                                      child: Text(
                                        'تعديل',
                                        style: TextStyle(
                                          height: 1.0,
                                          color: Colors.white,
                                          fontSize: 5.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Container(
                                    width: 20.w,
                                    decoration: const BoxDecoration(
                                      color: Color(
                                        0xFF1C30E0,
                                      ),
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
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text(
                                              'تأكيد الحذف',
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                  context,
                                                  'Cancel',
                                                ),
                                                child: const Text(
                                                  'Cancel',
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  HomeCubit.get(context)
                                                      .deleteFile(
                                                          idFacility:
                                                              HomeCubit.get(
                                                                      context)
                                                                  .f!
                                                                  .data!
                                                                  .id!);
                                                  return Navigator.pop(
                                                    context,
                                                    'ok',
                                                  );
                                                },
                                                child: const Text(
                                                  'OK',
                                                ),
                                              ),
                                            ],
                                          ),
                                        );

                                        if (formKey.currentState!.validate()) {}
                                      },
                                      child: Text(
                                        'حذف',
                                        style: TextStyle(
                                          height: 1.0,
                                          color: Colors.white,
                                          fontSize: 5.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        fallback: (context) => Center(
                            child: Text(
                          'اضغط على اسم منشأه',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                            color: Colors.grey,
                          ),
                        )),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      width: 30.w,
                      child: Column(
                        children: [
                          Text(
                            'المنشآت',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                            ),
                          ),
                          Expanded(
                            child: ConditionalBuilder(
                              condition:
                                  HomeCubit.get(context).facilities != null,
                              builder: (context) => ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    SingleChildScrollView(
                                  padding: EdgeInsetsDirectional.only(
                                    start: 2.w,
                                    end: 2.w,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.navigate_before_outlined,
                                            size: 10.sp,
                                          )),
                                      TextButton(
                                        onPressed: () {
                                          w;
                                          s;
                                          img;
                                          HomeCubit.get(context).getFile(
                                              HomeCubit.get(context)
                                                  .facilities!
                                                  .data[index]
                                                  .id!);
                                          HomeCubit.get(context).goToFolder(
                                              HomeCubit.get(context)
                                                  .facilities!
                                                  .data[index]
                                                  .id!);
                                        },
                                        child: Text(
                                          HomeCubit.get(context)
                                              .facilities!
                                              .data[index]
                                              .nameFacility!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                separatorBuilder: (context, index) => Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    start: 20.0,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 2.h,
                                    color: const Color(0xFF3F4048),
                                  ),
                                ),
                                itemCount: HomeCubit.get(context)
                                    .facilities!
                                    .data
                                    .length,
                              ),
                              fallback: (context) => Center(
                                child: Text(
                                  'لا توجد منشآت',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
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
              ),
            ),
          );
        },
      );
    });
  }
}
