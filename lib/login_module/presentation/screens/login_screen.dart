import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:mohamed/login_module/presentation/screens/register_screen.dart';
import '../component/component.dart';
import '../controller/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Sizer(
      builder: (
        context,
        orientation,
        deviceType,
      ) {
        return BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                body: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: SizerUtil.width * 2,
                      height: SizerUtil.height * 2,
                      color: const Color(
                        0xFF3F4048,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 110.w,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Color(
                                            0xFF3F4048,
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
                                        alignment: Alignment.centerRight,
                                        child: MaterialButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (
                                                  BuildContext context,
                                                ) =>
                                                    const RegisterScreen(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Register',
                                            style: TextStyle(
                                              height: 1.0,
                                              color: Colors.white,
                                              fontSize: 7.w,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      Container(
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
                                          8,
                                        ),
                                        margin: const EdgeInsets.only(
                                          top: 20.0,
                                        ),
                                        alignment: Alignment.centerRight,
                                        child: MaterialButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                              height: 1.0,
                                              color: Colors.white,
                                              fontSize: 7.w,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    'Welcome',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'please login to your e-mail',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: defaultTextForm(
                                      color: Colors.white,
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      label: 'Email Address',
                                      prefix: Icons.email_outlined,
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
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: defaultTextForm(
                                      color: Colors.white,
                                      controller: passwordController,
                                      keyboardType: TextInputType.phone,
                                      label: 'Password',
                                      prefix: Icons.lock_outline,
                                      suffix:
                                          LoginCubit.get(context).suffixIcon,
                                      suffixPress: () {
                                        LoginCubit.get(context)
                                            .changeSuffixIcon();
                                      },
                                      onSubmit: (value) {
                                        if (formKey.currentState!.validate()) {
                                          LoginCubit.get(context).signIn(
                                            email: emailController.text,
                                            pass: passwordController.text,
                                            context: context,
                                          );
                                        }
                                      },
                                      onChange: (value) {},
                                      onTap: () {},
                                      isPassword:
                                          LoginCubit.get(context).isPassword,
                                      validate: (String? value) {
                                        if (value!.length < 6) {
                                          return 'Password must be not empty';
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                      end: 85.w,
                                      start: 5.w,
                                    ),
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
                                    alignment: Alignment.center,
                                    child: MaterialButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          LoginCubit.get(context).signIn(
                                            email: emailController.text,
                                            pass: passwordController.text,
                                            context: context,
                                          );
                                        }
                                      },
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          height: 1,
                                          color: Colors.white,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    'Terms and conditions & privacy policy',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Image(
                            height: 100.h,
                            width: 55.w,
                            fit: BoxFit.cover,
                            image: const AssetImage(
                              'assets/21.png',
                            ),
                          ),
                        ],
                      ),
                    ),
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
