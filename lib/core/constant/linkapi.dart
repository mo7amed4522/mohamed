class AppLink {
  // ================================ Server Link ========================= //
  static const String serverLink = "http://localhost/windows_app";
  // ================================ Auth ========================= //
  static const String signinLink = "$serverLink/auth/signin.php";
  static const String signUpLink = "$serverLink/auth/signup.php";
  // ================================ Home Region ========================= //
  static const String getRegionLink = "$serverLink/region/getregion.php";
  static const String addRegionLink = "$serverLink/region/insertRegion.php";
  static const String deleteRegionLink = "$serverLink/region/deleteRegion.php";
  // ================================ Home Place ========================= //
  static const String getPlaceLink = "$serverLink/place/getPlace.php";
  static const String addPlaceLink = "$serverLink/place/insertPlace.php";
  static const String deletePlaceLink = "$serverLink/place/deletePlace.php";
  // ================================ Home Occupancy ========================= //
  static const String getOccupationLink =
      "$serverLink/occupancy/getOccupancy.php";
  static const String insertOccupationLink =
      "$serverLink/occupancy/insertOccupancy.php";
  static const String deleteOccupationLink =
      "$serverLink/occupancy/deleteOccupancy.php ";
  static const String updateOccupationLink =
      "$serverLink/occupancy/updateOccupancy.php ";
  // ================================ Home filesData ========================= //
  static const String insertFileLink = "$serverLink/file/insertData.php";
  static const String getFilesLink = "$serverLink/file/getFilesData.php";
  static const String getFileLink = "$serverLink/file/getFileData.php";
  static const String deleteFileLink = "$serverLink/file/deleteFilesData.php";
  static const String updateFileLink = "$serverLink/file/updateFilesData.php";
  // ================================ upload ========================= //
  static const String uploadFileLink = "$serverLink/file/uploadimage.php";
  // ================================ get Folder ========================= //
  static const String gotoFolder = "$serverLink/file/getFolder.php";
  // ================================ full Filled ========================= //
  static const String getFillFilled = "$serverLink/finshed/fullfilled.php";
  // ================================ Unfull Filled ========================= //
  static const String getUnFillFilled =
      "$serverLink/unfinshed/unfullfilled.php";
  // ================================ Search ========================= //
  static const String sarchLink = "$serverLink/search/searchFilesData.php";
  static const String searcajaxhLink = "$serverLink/search/search.php";
}
