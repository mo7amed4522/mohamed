class LoginModel {
  String? status;
  UserDate? data;

  LoginModel.formJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? UserDate.formJson(
            json['data'],
          )
        : null;
  }
}

class UserDate {
  String? id;
  String? email;
  String? pass;

  UserDate.formJson(Map<String, dynamic> json) {
    id = json['ID'];
    email = json['email'];
    pass = json['pass'];
  }
}

class Register {
  String? status;
  Register.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }
}
