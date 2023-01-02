// ignore_for_file: non_constant_identifier_names
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';
import 'package:mohamed/home_module/presentation/controller/home_cubit.dart';
import 'package:mohamed/home_module/presentation/screens/home_screen.dart';
import '../../../core/func/filePicker.dart';
import '../../../login_module/presentation/component/component.dart';
import 'occupations_screen.dart';

File? img;
File? w;
File? s;

class AddOccupationScreen extends StatelessWidget {
  const AddOccupationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      var formKey = GlobalKey<FormState>();
      var facilityName = TextEditingController();
      var address = TextEditingController();
      var ownerName = TextEditingController();
      var cellNumber = TextEditingController();
      var phone = OtpFieldController();
      String? phone_otp;
      var nationalID = OtpFieldController();
      String? nationalID_Otp;
      var fulfilled = TextEditingController();
      var reFulfilled = TextEditingController();
      late DateTime datetime1;
      late DateTime datetime2;
      int? m;

      return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF313232),
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                'الاشغالات',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: const Color(0xFF3F4048),
            body: Form(
              key: formKey,
              child: Container(
                padding: EdgeInsetsDirectional.all(10.sp),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'اسم المنشأة',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.sp),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 10.w),
                                  child: defaultTextForm(
                                    color: Colors.white,
                                    controller: facilityName,
                                    keyboardType: TextInputType.emailAddress,
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
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'العنوان',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.sp),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 10.w),
                                  child: defaultTextForm(
                                    color: Colors.white,
                                    controller: address,
                                    keyboardType: TextInputType.emailAddress,
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
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'رقم الملف',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.sp),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 10.w),
                                  child: defaultTextForm(
                                    color: Colors.white,
                                    controller: cellNumber,
                                    keyboardType: TextInputType.emailAddress,
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
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'اسم المالك',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.sp),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 10.w),
                                  child: defaultTextForm(
                                    color: Colors.white,
                                    controller: ownerName,
                                    keyboardType: TextInputType.emailAddress,
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
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'رقم الهاتف',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.sp),
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: OTPTextField(
                                    keyboardType: TextInputType.phone,
                                    controller: phone,
                                    isDense: true,
                                    length: 11,
                                    width: 100.w,
                                    onCompleted: (String? pin) {
                                      phone_otp = pin;
                                      if (kDebugMode) {
                                        print("Completed: $phone_otp");
                                      }
                                    },
                                    onChanged: (String? pin) {},
                                    otpFieldStyle: OtpFieldStyle(
                                      focusBorderColor: Colors.white,
                                    ),
                                    textFieldAlignment:
                                        MainAxisAlignment.spaceAround,
                                    fieldWidth: 5.w,
                                    fieldStyle: FieldStyle.box,
                                    outlineBorderRadius: 5.sp,
                                    style: TextStyle(fontSize: 10.sp),
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
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 70.w),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: OTPTextField(
                            isDense: false,
                            controller: nationalID,
                            length: 14,
                            width: 100.w,
                            keyboardType: TextInputType.phone,
                            onChanged: (String? pin) {},
                            onCompleted: (String? pin) {
                              nationalID_Otp = pin;
                              if (kDebugMode) {
                                print("Completed: $nationalID_Otp");
                              }
                            },
                            otpFieldStyle: OtpFieldStyle(
                              focusBorderColor: Colors.white,
                            ),
                            textFieldAlignment: MainAxisAlignment.spaceBetween,
                            fieldWidth: 5.w,
                            fieldStyle: FieldStyle.box,
                            outlineBorderRadius: 5.sp,
                            style: TextStyle(fontSize: 10.sp),
                          ),
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
                              Fun().pickFile1();

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
                                Fun().pickFile2();
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
                                Fun().pickFile3();
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                      activeColor: const Color(0xFF1C30E0),
                                      value: 0,
                                      groupValue: HomeCubit.get(context).num,
                                      onChanged: (value) {
                                        HomeCubit.get(context)
                                            .changeRadioBox(value: 0);
                                      }),
                                  Text(
                                    'مستوفى',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10.sp),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                      activeColor: const Color(0xFF1C30E0),
                                      value: 1,
                                      groupValue: HomeCubit.get(context).num,
                                      onChanged: (value) {
                                        HomeCubit.get(context)
                                            .changeRadioBox(value: 1);
                                      }),
                                  Text(
                                    'غير مستوفى',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 10.w),
                              child: defaultTextForm(
                                color: Colors.white,
                                controller: fulfilled,
                                keyboardType: TextInputType.datetime,
                                label: ' موعد الاستلام',
                                prefix: Icons.date_range_outlined,
                                onSubmit: (value) {},
                                onChange: (value) {},
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.parse('1000-12-23'),
                                    lastDate: DateTime.parse('3050-12-10'),
                                  ).then((value) {
                                    if (HomeCubit.get(context).num == 0) {
                                      m = value!.month + 12;
                                    } else {
                                      m = value!.month + 3;
                                    }
                                    datetime1 = DateTime(
                                        value.year, value.month, value.day);
                                    fulfilled.text =
                                        value.toString().substring(0, 10);
                                    datetime2 =
                                        DateTime(value.year, m!, value.day);
                                    if (kDebugMode) {
                                      print(datetime2);
                                    }
                                    reFulfilled.text =
                                        datetime2.toString().substring(0, 10);
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
                          Flexible(
                            fit: FlexFit.tight,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 10.w),
                              child: defaultTextForm(
                                color: Colors.white,
                                controller: reFulfilled,
                                keyboardType: TextInputType.emailAddress,
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
                      Container(
                        width: 20.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1C30E0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        padding: const EdgeInsetsDirectional.all(8.0),
                        margin: const EdgeInsets.only(top: 20.0),
                        alignment: Alignment.center,
                        child: MaterialButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              if (img == null && s == null) {
                                HomeCubit.get(context).insertFile0(
                                  name: facilityName.text,
                                  address: address.text,
                                  owner: ownerName.text,
                                  number: cellNumber.text,
                                  idCard: nationalID_Otp!,
                                  phone: phone_otp!,
                                  date1: datetime1,
                                  date2: datetime2,
                                  choice: HomeCubit.get(context).num,
                                  idOccupation: idOccupation2,
                                  file: w!,
                                );
                              } else if (s == null) {
                                HomeCubit.get(context).insertFile1(
                                    name: facilityName.text,
                                    address: address.text,
                                    owner: ownerName.text,
                                    number: cellNumber.text,
                                    idCard: nationalID_Otp!,
                                    phone: phone_otp!,
                                    date1: datetime1,
                                    date2: datetime2,
                                    choice: HomeCubit.get(context).num,
                                    idOccupation: idOccupation2,
                                    file: w!,
                                    image: img!);
                              } else if (img == null) {
                                HomeCubit.get(context).insertFile2(
                                    name: facilityName.text,
                                    address: address.text,
                                    owner: ownerName.text,
                                    number: cellNumber.text,
                                    idCard: nationalID_Otp!,
                                    phone: phone_otp!,
                                    date1: datetime1,
                                    date2: datetime2,
                                    choice: HomeCubit.get(context).num,
                                    idOccupation: idOccupation2,
                                    file: w!,
                                    scan: s!);
                              } else {
                                HomeCubit.get(context).insertFile(
                                  name: facilityName.text,
                                  address: address.text,
                                  owner: ownerName.text,
                                  number: cellNumber.text,
                                  idCard: nationalID_Otp!,
                                  phone: phone_otp!,
                                  date1: datetime1,
                                  date2: datetime2,
                                  choice: HomeCubit.get(context).num,
                                  idOccupation: idOccupation2,
                                  file: w!,
                                  scan: s!,
                                  image: img!,
                                );
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const HomeScreen()));

                              HomeCubit.get(context).getFillFilled();
                              HomeCubit.get(context).getUnFillFilled();
                            }
                          },
                          child: Text(
                            'حفظ',
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
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
