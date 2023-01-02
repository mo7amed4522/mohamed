import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/home_module/presentation/controller/home_cubit.dart';
import 'package:mohamed/home_module/presentation/screens/home_screen.dart';
import 'package:mohamed/home_module/presentation/screens/occupations_screen.dart';
import 'package:mohamed/login_module/presentation/component/component.dart';
import 'package:sizer/sizer.dart';

late int idPlace2;
late String namePlace;

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var place = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Sizer(
      builder: (
        context,
        orientation,
        deviceType,
      ) {
        return Scaffold(
          body: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.all(
                    20.sp,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الاماكن',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ConditionalBuilder(
                                condition: HomeCubit.get(context).place != null,
                                builder: (context) => ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
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
                                          padding:
                                              const EdgeInsetsDirectional.all(
                                            8.0,
                                          ),
                                          margin: const EdgeInsets.only(
                                            top: 20.0,
                                          ),
                                          alignment: Alignment.center,
                                          child: MaterialButton(
                                            onPressed: () {
                                              namePlace = HomeCubit.get(context)
                                                  .place!
                                                  .data[index]
                                                  .name!;
                                              idPlace2 = HomeCubit.get(context)
                                                  .place!
                                                  .data[index]
                                                  .id!;
                                              HomeCubit.get(context)
                                                  .getOccupation(
                                                id: HomeCubit.get(context)
                                                    .place!
                                                    .data[index]
                                                    .id!,
                                              );
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      const OccupationsScreen(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              HomeCubit.get(context)
                                                  .place!
                                                  .data[index]
                                                  .name!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                height: 1.0,
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      IconButton(
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
                                                  onPressed: () =>
                                                      Navigator.pop(
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
                                                        .deletePlace(
                                                      id: HomeCubit.get(context)
                                                          .place!
                                                          .data[index]
                                                          .id!,
                                                      idRegion: idRegion2,
                                                    );
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
                                        },
                                        icon: Icon(
                                          Icons.delete_outline_rounded,
                                          size: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  separatorBuilder: (context, index) => Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      start: 20.0,
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 3.h,
                                      color: const Color(
                                        0xFF3F4048,
                                      ),
                                    ),
                                  ),
                                  itemCount:
                                      HomeCubit.get(context).place!.data.length,
                                ),
                                fallback: (context) => Center(
                                  child: Text(
                                    'لا توجد اماكن بعد',
                                    style: TextStyle(
                                      fontSize: 10.sp,
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
                      SizedBox(
                        width: 4.5.w,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 0,
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 2.w,
                            ),
                            width: 1.w,
                            height: double.infinity,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'اضافه مكان جديد',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              defaultTextForm(
                                color: Colors.white,
                                controller: place,
                                keyboardType: TextInputType.text,
                                label: 'مكان جديده',
                                prefix: Icons.ac_unit,
                                onTap: () {},
                                onChange: (value) {},
                                onSubmit: (value) {
                                  if (formKey.currentState!.validate()) {
                                    HomeCubit.get(context).insertPlace(
                                      name: place.text,
                                      idRegion: idRegion2,
                                    );
                                    place.text = '';
                                  }
                                },
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'ادخل اسم المكان';
                                  }
                                },
                              ),
                              Container(
                                width: 12.w,
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
                                      HomeCubit.get(context).insertPlace(
                                        name: place.text,
                                        idRegion: idRegion2,
                                      );
                                      place.text = '';
                                    }
                                  },
                                  child: Text(
                                    'حفظ',
                                    style: TextStyle(
                                      height: 1.0,
                                      color: Colors.white,
                                      fontSize: 3.w,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 23.h,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'رجوع',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
