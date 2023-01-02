class Region {
  String? status;
  List<RegionData> data = [];
  Region.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    json['data'].forEach(
      (element) {
        data.add(
          RegionData.fromJson(
            element,
          ),
        );
      },
    );
  }
}

class RegionData {
  int? id;
  String? name;
  RegionData.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    name = json['name'];
  }
}
