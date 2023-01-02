import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:mohamed/home_module/presentation/controller/home_cubit.dart';
import 'package:mohamed/home_module/presentation/screens/edite_screen.dart';
import 'package:mohamed/home_module/presentation/screens/place_screen.dart';
import 'package:mohamed/home_module/presentation/screens/search_screen.dart';
import 'package:mohamed/login_module/presentation/component/component.dart';
import 'occupations_screen.dart';

late int idRegion2;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var region = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Sizer(builder: (context, orientation, deviceType) {
      return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                iconSize: 13.sp,
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
                color: Colors.white,
              ),
              centerTitle: true,
              backgroundColor: const Color(
                0xFF3F4048,
              ),
              elevation: 0.0,
              title: Text(
                'قسم الوقايه',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Form(
              key: formKey,
              child: Container(
                padding: EdgeInsetsDirectional.all(
                  10.sp,
                ),
                color: const Color(
                  0xFF3F4048,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsetsDirectional.all(
                              5.sp,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFF1C30E0,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  15.sp,
                                ),
                              ),
                            ),
                            child: Text(
                              'غير مستوفى',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          ConditionalBuilder(
                            condition:
                                HomeCubit.get(context).unFillFilledData != null,
                            builder: (context) => Expanded(
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 18.w,
                                        child: Text(
                                          HomeCubit.get(context)
                                              .unFillFilledData!
                                              .data[index]
                                              .nameFacility!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.5.w,
                                      ),
                                      Text(
                                        HomeCubit.get(context)
                                            .unFillFilledData!
                                            .data[index]
                                            .date2
                                            .toString()
                                            .substring(
                                              0,
                                              10,
                                            ),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.5.w,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          color: Colors.black,
                                          onPressed: () {
                                            HomeCubit.get(context).getFile(
                                              HomeCubit.get(context)
                                                  .unFillFilledData!
                                                  .data[index]
                                                  .id!,
                                            );
                                            idOccupation2 =
                                                HomeCubit.get(context)
                                                    .unFillFilledData!
                                                    .data[index]
                                                    .idOccupation!;
                                            HomeCubit.get(context).goToFolder(
                                              HomeCubit.get(context)
                                                  .unFillFilledData!
                                                  .data[index]
                                                  .id!,
                                            );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const EditeScreen(),
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.check,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          color: Colors.black,
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
                                                      idOccupation2 =
                                                          HomeCubit.get(context)
                                                              .fillFilledData!
                                                              .data[index]
                                                              .idOccupation!;
                                                      HomeCubit.get(context)
                                                          .deleteFile(
                                                        idFacility: HomeCubit
                                                                .get(context)
                                                            .unFillFilledData!
                                                            .data[index]
                                                            .id!,
                                                      );
                                                      HomeCubit.get(context)
                                                          .getUnFillFilled();
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
                                          icon: const Icon(
                                            Icons.close,
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
                                    height: 3.h,
                                    color: const Color(
                                      0xFF3F4048,
                                    ),
                                  ),
                                ),
                                itemCount: HomeCubit.get(context)
                                    .unFillFilledData!
                                    .data
                                    .length,
                              ),
                            ),
                            fallback: (context) => Center(
                              child: Text(
                                'لا يوجد منشأت ',
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
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 5.sp,
                      ),
                      child: Container(
                        height: double.infinity,
                        width: 3.0,
                        color: const Color(
                          0xFF222224,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsetsDirectional.all(
                              5.sp,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFF1C30E0,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  10.sp,
                                ),
                              ),
                            ),
                            child: Text(
                              ' مستوفى',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          ConditionalBuilder(
                            condition:
                                HomeCubit.get(context).fillFilledData != null,
                            builder: (context) => Expanded(
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 18.w,
                                        child: Text(
                                          HomeCubit.get(context)
                                              .fillFilledData!
                                              .data[index]
                                              .nameFacility!,
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.5.w,
                                      ),
                                      Text(
                                        HomeCubit.get(context)
                                            .fillFilledData!
                                            .data[index]
                                            .date2
                                            .toString()
                                            .substring(
                                              0,
                                              10,
                                            ),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.5.w,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          color: Colors.black,
                                          onPressed: () {
                                            HomeCubit.get(context).getFile(
                                              HomeCubit.get(context)
                                                  .fillFilledData!
                                                  .data[index]
                                                  .id!,
                                            );
                                            idOccupation2 =
                                                HomeCubit.get(context)
                                                    .fillFilledData!
                                                    .data[index]
                                                    .idOccupation!;
                                            HomeCubit.get(context).goToFolder(
                                              HomeCubit.get(context)
                                                  .fillFilledData!
                                                  .data[index]
                                                  .id!,
                                            );
                                            HomeCubit.get(context).getFilesData(
                                              idOccupation:
                                                  HomeCubit.get(context)
                                                      .fillFilledData!
                                                      .data[index]
                                                      .idOccupation!,
                                            );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const EditeScreen(),
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.check,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          color: Colors.black,
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: const Text(
                                                  'تأكيد الحذف',
                                                ),
                                                actions: [
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
                                                      idOccupation2 =
                                                          HomeCubit.get(context)
                                                              .fillFilledData!
                                                              .data[index]
                                                              .idOccupation!;
                                                      HomeCubit.get(context)
                                                          .deleteFile(
                                                              idFacility: HomeCubit
                                                                      .get(
                                                                          context)
                                                                  .fillFilledData!
                                                                  .data[index]
                                                                  .id!);
                                                      HomeCubit.get(context)
                                                          .getFillFilled();
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
                                          icon: const Icon(
                                            Icons.close,
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
                                    height: 3.h,
                                    color: const Color(0xFF3F4048),
                                  ),
                                ),
                                itemCount: HomeCubit.get(context)
                                    .fillFilledData!
                                    .data
                                    .length,
                              ),
                            ),
                            fallback: (context) => Center(
                              child: Text(
                                'لا يوجد منشأت ',
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
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 5.sp,
                      ),
                      child: Container(
                        height: double.infinity,
                        width: 3.0,
                        color: const Color(
                          0xFF222224,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defaultTextForm(
                                  color: Colors.white,
                                  controller: region,
                                  keyboardType: TextInputType.text,
                                  label: 'منطقه جديده',
                                  prefix: Icons.ac_unit,
                                  onTap: () {},
                                  onChange: (value) {},
                                  onSubmit: (value) {
                                    if (formKey.currentState!.validate()) {
                                      HomeCubit.get(context).insertRegion(
                                        name: region.text,
                                      );
                                      region.text = '';
                                    }
                                  },
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل اسم المنطقه';
                                    }
                                  },
                                ),
                                Container(
                                  width: 12.w,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF1C30E0),
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
                                        HomeCubit.get(context).insertRegion(
                                          name: region.text,
                                        );
                                        region.text = '';
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
                                  height: 3.h,
                                ),
                                const Expanded(
                                  child: GetRegion(),
                                ),
                              ],
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

class GetRegion extends StatelessWidget {
  const GetRegion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: HomeCubit.get(context).region != null,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => SingleChildScrollView(
              padding: EdgeInsetsDirectional.only(
                start: 10.w,
                end: 10.w,
              ),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      idRegion2 =
                          HomeCubit.get(context).region!.data[index].id!;
                      HomeCubit.get(context).getPlace(
                        id: HomeCubit.get(context).region!.data[index].id!,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const PlaceScreen(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 35.w,
                      child: Text(
                        HomeCubit.get(context).region!.data[index].name!,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 8.sp,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text(
                            'تأكيد الحذف',
                          ),
                          actions: [
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
                                HomeCubit.get(context).deleteRegion(
                                  id: HomeCubit.get(context)
                                      .region!
                                      .data[index]
                                      .id!,
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
                      size: 10.sp,
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
                height: 3.h,
                color: const Color(
                  0xFF3F4048,
                ),
              ),
            ),
            itemCount: HomeCubit.get(context).region!.data.length,
          ),
          fallback: (context) => Center(
            child: Text(
              'لا توجد مناطق',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        );
      },
    );
  }
}
