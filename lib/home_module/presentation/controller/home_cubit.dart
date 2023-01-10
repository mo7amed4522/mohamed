// ignore_for_file: unused_field
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/core/constant/curd.dart';
import 'package:mohamed/core/constant/linkapi.dart';
import 'package:mohamed/home_module/file_model.dart';
import 'package:mohamed/home_module/place_model.dart';
import 'package:mohamed/home_module/presentation/screens/home_screen.dart';
import 'package:mohamed/home_module/presentation/screens/occupations_screen.dart';
import 'package:mohamed/home_module/presentation/screens/place_screen.dart';
import 'package:mohamed/home_module/region_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  bool enable = false;
  final Curd _curd = Curd();
  Region? region;
  Place? place;
  Occupation? occupation;

  getRegion() async {
    region = null;
    emit(RegionLoadingState());
    var response = await _curd.getRequest(AppLink.getRegionLink);
    if (response['status'] == 'success') {
      emit(RegionSuccessState());
      region = Region.fromJson(response);
    } else {
      emit(RegionErrorState());
    }
  }

  insertRegion({required String name}) async {
    emit(InsertRegionLoadingState());
    var response = await _curd.postRequest(AppLink.addRegionLink, {
      'name': name,
    });
    if (response['status'] == 'success') {
      emit(
        InsertRegionSuccessState(),
      );
      getRegion();
    } else {
      emit(
        InsertRegionErrorState(),
      );
    }
  }

  deleteRegion({required int id}) async {
    emit(
      InsertRegionLoadingState(),
    );
    var response = await _curd.postRequest(AppLink.deleteRegionLink, {
      'ID': id.toString(),
    });
    if (response['status'] == 'success') {
      emit(
        DeleteRegionSuccessState(),
      );
      getRegion();
    } else {
      emit(
        DeleteRegionErrorState(),
      );
    }
  }

  getPlace({required int id}) async {
    place = null;
    emit(
      PlaceLoadingState(),
    );
    var response = await _curd.postRequest(AppLink.getPlaceLink, {
      'ID_Region': id.toString(),
    });
    if (response['status'] == 'success') {
      emit(PlaceSuccessState());
      place = Place.fromJson(
        response,
      );
    } else {
      if (kDebugMode) {
        print(
          'error',
        );
      }
      emit(
        PlaceErrorState(),
      );
    }
  }

  insertPlace({
    required String name,
    required int idRegion,
  }) async {
    emit(
      InsertPlaceLoadingState(),
    );
    var response = await _curd.postRequest(AppLink.addPlaceLink, {
      'name': name,
      'ID_Region': idRegion.toString(),
    });
    if (response['status'] == 'success') {
      emit(
        InsertPlaceSuccessState(),
      );
      getPlace(id: idRegion2);
    } else {
      emit(
        InsertPlaceErrorState(),
      );
    }
  }

  deletePlace({
    required int id,
    required int idRegion,
  }) async {
    emit(
      InsertRegionLoadingState(),
    );
    var response = await _curd.postRequest(AppLink.deletePlaceLink, {
      'ID': id.toString(),
      'ID_Region': idRegion.toString(),
    });
    if (response['status'] == 'success') {
      emit(
        DeletePlaceSuccessState(),
      );
      getPlace(id: idRegion2);
    } else {
      emit(
        DeletePlaceErrorState(),
      );
    }
  }

  getOccupation({required int id}) async {
    occupation = null;
    emit(
      OccupationLoadingState(),
    );
    var response = await _curd.postRequest(AppLink.getOccupationLink, {
      'ID_Place': id.toString(),
    });
    if (response['status'] == 'success') {
      emit(OccupationSuccessState());
      occupation = Occupation.fromJson(
        response,
      );
    } else {
      if (kDebugMode) {
        print(
          'error',
        );
      }
      emit(
        OccupationErrorState(),
      );
    }
  }

  insertOccupation({
    required String name,
    required int idPlace,
  }) async {
    emit(
      InsertOccupationLoadingState(),
    );
    var response = await _curd.postRequest(AppLink.insertOccupationLink, {
      'name': name,
      'ID_Place': idPlace.toString(),
    });
    if (response['status'] == 'success') {
      emit(
        InsertOccupationSuccessState(),
      );
      getOccupation(
        id: idPlace2,
      );
    } else {
      emit(
        InsertOccupationErrorState(),
      );
    }
  }

  deleteOccupation({
    required int id,
    required int idRegion,
    required int idPlace,
  }) async {
    emit(
      InsertOccupationLoadingState(),
    );
    var response = await _curd.postRequest(AppLink.deleteOccupationLink, {
      'ID': id.toString(),
      'ID_Region': idRegion.toString(),
      'ID_Place': idPlace.toString(),
    });
    if (response['status'] == 'success') {
      emit(
        DeleteOccupationSuccessState(),
      );
      getOccupation(
        id: idPlace2,
      );
    } else {
      emit(
        DeleteOccupationErrorState(),
      );
    }
  }

  updateOccupation({
    required int id,
    required String name,
  }) async {
    emit(
      UpdateOccupationLoadingState(),
    );
    var response = await _curd.postRequest(AppLink.updateOccupationLink, {
      'ID': id.toString(),
      'name':name,
    });
    if (response['status'] == 'success') {
      emit(
        UpdateOccupationSuccessState(),
      );
      getOccupation(
        id: idPlace2,
      );
    } else {
      emit(
        UpdateOccupationErrorState(),
      );
    }
  }

  int num = 0;

  changeRadioBox({required int value}) {
    num = value;
    emit(
      ChangeRadioBoxState(),
    );
  }

  insertFile({
    required String name,
    required String address,
    required String owner,
    required String number,
    required String idCard,
    required String phone,
    required DateTime date1,
    required DateTime date2,
    required int choice,
    required int idOccupation,
    required File file,
    required File image,
    required File scan,
  }) async {
    emit(
      InsertFileLoadingState(),
    );

    var response = await _curd.postRequestWithFile(
      AppLink.insertFileLink,
      {
        'name': name,
        'address': address,
        'owner': owner,
        'number': number,
        'ID_Card': idCard,
        'phone': phone,
        'date1': date1.toString(),
        'date2': date2.toString(),
        'choice': choice.toString(),
        'ID_Occupancy': idOccupation.toString(),
      },
      file,
      image,
      scan,
    );
    if (response['status'] == 'success') {
      emit(InsertFileSuccessState());
      if (kDebugMode) {
        print(
          'success',
        );
      }
    } else {
      emit(
        InsertFileErrorState(),
      );
    }
  }

  insertFile0({
    required String name,
    required String address,
    required String owner,
    required String number,
    required String idCard,
    required String phone,
    required DateTime date1,
    required DateTime date2,
    required int choice,
    required int idOccupation,
    required File file,
  }) async {
    emit(
      InsertFileLoadingState(),
    );

    var response = await _curd.postRequestWithFile0(
      AppLink.insertFileLink,
      {
        'name': name,
        'address': address,
        'owner': owner,
        'number': number,
        'ID_Card': idCard,
        'phone': phone,
        'date1': date1.toString(),
        'date2': date2.toString(),
        'choice': choice.toString(),
        'ID_Occupancy': idOccupation.toString(),
      },
      file,
    );
    if (response['status'] == 'success') {
      emit(InsertFileSuccessState());
      if (kDebugMode) {
        print(
          'success',
        );
      }
    } else {
      emit(
        InsertFileErrorState(),
      );
    }
  }

  insertFile1({
    required String name,
    required String address,
    required String owner,
    required String number,
    required String idCard,
    required String phone,
    required DateTime date1,
    required DateTime date2,
    required int choice,
    required int idOccupation,
    required File file,
    required File image,
  }) async {
    emit(
      InsertFileLoadingState(),
    );

    var response = await _curd.postRequestWithFile1(
      AppLink.insertFileLink,
      {
        'name': name,
        'address': address,
        'owner': owner,
        'number': number,
        'ID_Card': idCard,
        'phone': phone,
        'date1': date1.toString(),
        'date2': date2.toString(),
        'choice': choice.toString(),
        'ID_Occupancy': idOccupation.toString(),
      },
      file,
      image,
    );
    if (response['status'] == 'success') {
      emit(InsertFileSuccessState());
      if (kDebugMode) {
        print(
          'success',
        );
      }
    } else {
      emit(
        InsertFileErrorState(),
      );
    }
  }

  insertFile2({
    required String name,
    required String address,
    required String owner,
    required String number,
    required String idCard,
    required String phone,
    required DateTime date1,
    required DateTime date2,
    required int choice,
    required int idOccupation,
    required File file,
    required File scan,
  }) async {
    emit(
      InsertFileLoadingState(),
    );

    var response = await _curd.postRequestWithFile2(
      AppLink.insertFileLink,
      {
        'name': name,
        'address': address,
        'owner': owner,
        'number': number,
        'ID_Card': idCard,
        'phone': phone,
        'date1': date1.toString(),
        'date2': date2.toString(),
        'choice': choice.toString(),
        'ID_Occupancy': idOccupation.toString(),
      },
      file,
      scan,
    );
    if (response['status'] == 'success') {
      emit(InsertFileSuccessState());
      if (kDebugMode) {
        print(
          'success',
        );
      }
    } else {
      emit(
        InsertFileErrorState(),
      );
    }
  }

  var facilityName = TextEditingController();
  var address = TextEditingController();
  var ownerName = TextEditingController();
  var phone = TextEditingController();
  var nationalID = TextEditingController();
  var fulfilled = TextEditingController();
  var reFulfilled = TextEditingController();
  late DateTime datetime1;
  late DateTime datetime2;
  var cellNumber = TextEditingController();
  GetFilesName? facilities;
  GetFile? f;
  getFilesData({
    required int idOccupation,
  }) async {
    facilities = null;
    emit(
      FilesDataLoadingState(),
    );
    var response = await _curd.postRequest(AppLink.getFilesLink, {
      'ID_Occupancy': idOccupation.toString(),
    });
    if (response['status'] == 'success') {
      emit(FilesDataSuccessState());
      facilities = GetFilesName.fromJson(
        response,
      );
    } else {
      if (kDebugMode) {
        print(
          'error',
        );
      }
      emit(
        FilesDataErrorState(),
      );
    }
  }

  getFile(int idFacility) async {
    emit(
      GetFileLoadingState(),
    );
    var response = await _curd.postRequest(AppLink.getFileLink, {
      'ID': idFacility.toString(),
    });
    if (response['status'] == 'success') {
      f = GetFile.fromJson(
        response,
      );
      emit(
        GetFileSuccessState(),
      );
      facilityName.text = f!.data!.nameFacility!;
      address.text = f!.data!.address!;
      ownerName.text = f!.data!.owner!;
      fulfilled.text = f!.data!.date1!.substring(
        0,
        10,
      );
      reFulfilled.text = f!.data!.date2!.substring(
        0,
        10,
      );
      num = f!.data!.choice!;
      cellNumber.text = f!.data!.number!;
      phone.text = f!.data!.phone!;
      nationalID.text = f!.data!.idCard!;
    } else {
      if (kDebugMode) {
        print(
          'error',
        );
      }
      emit(
        GetFileErrorState(),
      );
    }
  }

  deleteFile({
    required int idFacility,
  }) async {
    emit(DeleteFileLoadingState());
    var response = await _curd.postRequest(AppLink.deleteFileLink, {
      'ID': idFacility.toString(),
    });
    if (response['status'] == 'success') {
      emit(DeleteFileSuccessState());
      f = null;
      getFilesData(
        idOccupation: idOccupation2,
      );
    } else {
      emit(
        DeleteFileErrorState(),
      );
    }
  }

  updateFile() async {
    emit(
      UpdateFileLoadingState(),
    );
    var response = await _curd.postRequest(AppLink.updateFileLink, {
      'ID': f!.data!.id!.toString(),
      'name': facilityName.text,
      'address': address.text,
      'owner': ownerName.text,
      'ID_Card': nationalID.text,
      'phone': phone.text,
      'date1': fulfilled.text,
      'date2': reFulfilled.text,
      'number': cellNumber.text,
      'choice': num.toString(),
    });
    if (response['status'] == 'success') {
      emit(
        UpdateFileSuccessState(),
      );
      f = null;
      getFilesData(
        idOccupation: idOccupation2,
      );
    } else {
      emit(
        UpdateFileErrorState(),
      );
    }
  }

  uploadFile(File a) async {
    emit(
      UploadFileLoadingState(),
    );
    var response = await _curd.postRequestWithImage(
        AppLink.uploadFileLink,
        {
          'ID': f!.data!.id!.toString(),
        },
        a);
    if (response['status'] == 'success') {
      emit(
        UploadFileSuccessState(),
      );
      f = null;
      getFilesData(idOccupation: idOccupation2);
    } else {
      emit(
        UploadFileErrorState(),
      );
    }
  }

  GoToFiles? path;
  goToFolder(int idFacility) async {
    emit(
      GoToFolderLoadingState(),
    );
    var response = await _curd.postRequest(AppLink.gotoFolder, {
      'ID': idFacility.toString(),
    });
    if (response['status'] == 'success') {
      if (kDebugMode) {
        print('success');
      }
      path = GoToFiles.formJson(response);
      if (kDebugMode) {
        print(path!.path);
      }
      emit(
        GoToFolderSuccessState(),
      );
    } else {
      if (kDebugMode) {
        print('error');
      }
      emit(
        GoToFolderErrorState(),
      );
    }
  }

  GetFilesName? fillFilledData;

  getFillFilled() async {
    fillFilledData = null;
    emit(
      GetFillFilledLoadingState(),
    );
    var response = await _curd.getRequest(AppLink.getFillFilled);
    if (response['status'] == 'success') {
      emit(
        GetFillFilledSuccessState(),
      );
      fillFilledData = GetFilesName.fromJson(response);
    } else {
      emit(
        GetFillFilledErrorState(),
      );
    }
  }

  GetFilesName? unFillFilledData;

  getUnFillFilled() async {
    unFillFilledData = null;
    emit(
      GetUnFillFilledLoadingState(),
    );
    var response = await _curd.getRequest(AppLink.getUnFillFilled);
    if (response['status'] == 'success') {
      emit(
        GetUnFillFilledSuccessState(),
      );
      unFillFilledData = GetFilesName.fromJson(response);
    } else {
      emit(
        GetUnFillFilledErrorState(),
      );
    }
  }

  GetFilesName? searchData;
  searchajax({
    required String name,
  }) async {
    searchData = null;
    emit(
      SearchLoadingState(),
    );
    var response = await _curd.postRequest(AppLink.searcajaxhLink, {
      'name': name.toString(),
    });
    if (response['status'] == 'success') {
      emit(
        SearchSuccessState(),
      );
      searchData = GetFilesName.fromJson(response);
    } else {
      emit(
        SearchErrorState(),
      );
    }
  }
}
