class GetFilesName {
  String? status;
  List<DataFile> data = [];
  GetFilesName.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    json['data'].forEach(
      (element) {
        data.add(
          DataFile.fromJson(
            element,
          ),
        );
      },
    );
  }
}

class DataFile {
  int? id;
  String? nameFacility;
  String? address;
  String? owner;
  String? number;
  String? idCard;
  String? phone;
  String? date1;
  String? date2;
  int? choice;
  int? idOccupation;
  DataFile.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    nameFacility = json['name'];
    address = json['address'];
    owner = json['owner'];
    number = json['number'];
    idCard = json['ID_Card'];
    phone = json['phone'];
    date1 = json['date1'];
    date2 = json['date2'];
    choice = json['choice'];
    idOccupation = json['ID_Occupancy'];
  }
}

class GetFile {
  String? status;
  Data? data;
  GetFile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJson(
      json['data'],
    );
  }
}

class Data {
  int? id;
  String? nameFacility;
  String? address;
  String? owner;
  String? number;
  String? idCard;
  String? phone;
  String? date1;
  String? date2;
  int? choice;
  int? idOccupation;
  Data.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    nameFacility = json['name'];
    address = json['address'];
    owner = json['owner'];
    number = json['number'];
    idCard = json['ID_Card'];
    phone = json['phone'];
    date1 = json['date1'];
    date2 = json['date2'];
    choice = json['choice'];
    idOccupation = json['ID_Occupancy'];
  }
}

class GoToFiles {
  String? status;
  String? path;
  GoToFiles.formJson(Map<String, dynamic> json) {
    status = json['status'];
    path = json['path'];
  }
}
