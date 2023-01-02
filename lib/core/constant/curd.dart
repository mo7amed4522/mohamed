// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';

class Curd {
  getRequest(String url) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        if (kDebugMode) {
          print("Error ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error Catch $e");
      }
    }
  }

  postRequest(String url, Map data) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        if (kDebugMode) {
          print("Error ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error Catch $e");
      }
    }
  }

  postRequestWithFile(
    String url,
    Map data,
    File? file,
    File? image,
    File? scan,
  ) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    var length = await file!.length();
    var stream = http.ByteStream(file.openRead());
    var multipartFile = http.MultipartFile("word", stream, length,
        filename: basename(file.path));
    request.files.add(multipartFile);

    var length2 = await image!.length();
    var stream2 = http.ByteStream(image.openRead());
    var multipartFile2 = http.MultipartFile("photo", stream2, length2,
        filename: basename(image.path));
    request.files.add(multipartFile2);

    var length3 = await scan!.length();
    var stream3 = http.ByteStream(scan.openRead());
    var multipartFile3 = http.MultipartFile("scan", stream3, length3,
        filename: basename(scan.path));
    request.files.add(multipartFile3);

    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myrequest = await request.send();

    var response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if (kDebugMode) {
        print("Error ${myrequest.statusCode}");
      }
    }
  }

  postRequestWithFile0(
    String url,
    Map data,
    File? file,
  ) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    var length = await file!.length();
    var stream = http.ByteStream(file.openRead());
    var multipartFile = http.MultipartFile("word", stream, length,
        filename: basename(file.path));
    request.files.add(multipartFile);

    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myrequest = await request.send();

    var response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if (kDebugMode) {
        print("Error ${myrequest.statusCode}");
      }
    }
  }

  postRequestWithFile1(
    String url,
    Map data,
    File? file,
    File? image,
  ) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    var length = await file!.length();
    var stream = http.ByteStream(file.openRead());
    var multipartFile = http.MultipartFile("word", stream, length,
        filename: basename(file.path));
    request.files.add(multipartFile);

    var length2 = await image!.length();
    var stream2 = http.ByteStream(image.openRead());
    var multipartFile2 = http.MultipartFile("photo", stream2, length2,
        filename: basename(image.path));
    request.files.add(multipartFile2);

    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myrequest = await request.send();

    var response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if (kDebugMode) {
        print("Error ${myrequest.statusCode}");
      }
    }
  }

  postRequestWithFile2(
    String url,
    Map data,
    File? file,
    File? scan,
  ) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    var length = await file!.length();
    var stream = http.ByteStream(file.openRead());
    var multipartFile = http.MultipartFile("word", stream, length,
        filename: basename(file.path));
    request.files.add(multipartFile);

    var length3 = await scan!.length();
    var stream3 = http.ByteStream(scan.openRead());
    var multipartFile3 = http.MultipartFile("scan", stream3, length3,
        filename: basename(scan.path));
    request.files.add(multipartFile3);

    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myrequest = await request.send();

    var response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if (kDebugMode) {
        print("Error ${myrequest.statusCode}");
      }
    }
  }

  postRequestWithImage(String url, Map data, File file) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multipartFile = http.MultipartFile("word", stream, length,
        filename: basename(file.path));
    request.files.add(multipartFile);

    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myrequest = await request.send();

    var response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if (kDebugMode) {
        print("Error ${myrequest.statusCode}");
      }
    }
  }
}
