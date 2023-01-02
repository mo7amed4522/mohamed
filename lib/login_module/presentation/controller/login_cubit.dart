import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/core/constant/linkapi.dart';
import 'package:mohamed/home_module/presentation/screens/home_screen.dart';
import 'package:mohamed/login_module/presentation/screens/login_screen.dart';
import '../../../core/constant/curd.dart';
import '../component/component.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(
          LoginInitialState(),
        );

  static LoginCubit get(context) => BlocProvider.of(context);

  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;

  void changeSuffixIcon() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(
      PasswordVisibilityState(),
    );
  }

  final Curd _curd = Curd();

  signIn(
      {required String email, required String pass, required context}) async {
    emit(LoginLoadingState());
    var response = await _curd.postRequest(AppLink.signinLink, {
      "email": email,
      "pass": pass,
    });
    if (response['status'] == "success") {
      emit(
        LoginSuccessState(),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        ),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          Bar(
            title: 'Success!',
            message: 'Login success',
            contentType: ContentType.success,
          ),
        );
      if (kDebugMode) {
        print(
          "Success",
        );
      }
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          Bar(
            title: 'Error!',
            message: 'username or password not correct',
            contentType: ContentType.failure,
          ),
        );
      emit(
        LoginErrorState(),
      );
      if (kDebugMode) {
        print(
          "SignIn Fail",
        );
      }
    }
  }

  signUp({
    required String email,
    required String pass,
    required String repass,
    required context,
  }) async {
    var response = await _curd.postRequest(AppLink.signUpLink, {
      "email": email,
      "pass": pass,
      "repass": repass,
    });
    if (response['status'] == "success") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        ),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          Bar(
            title: 'Success!',
            message: 'Register success',
            contentType: ContentType.success,
          ),
        );
      if (kDebugMode) {
        print(
          "Success",
        );
      }
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          Bar(
            title: 'Error!',
            message: 'account is fount before',
            contentType: ContentType.failure,
          ),
        );
      if (kDebugMode) {
        print(
          "SignUp Fail",
        );
      }
    }
  }
}
