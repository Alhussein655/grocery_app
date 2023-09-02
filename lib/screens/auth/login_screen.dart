import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocey_app/constants/consts.dart';
import 'package:grocey_app/screens/auth/forget_password_screen.dart';
import 'package:grocey_app/screens/auth/register_screen.dart';
import 'package:grocey_app/screens/bottom_bar_screen.dart';
import 'package:grocey_app/screens/home_screen.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/auth_btn.dart';
import 'package:grocey_app/widgets/google_btn.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextController = TextEditingController();
  final passTextController = TextEditingController();
  final passFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool secureText = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailTextController.dispose();
    passTextController.dispose();
    passFocusNode.dispose();
  }

  void submitForm() {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      print('valid.....');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.screenSize;
    final color = utils.color;
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            duration: 800,
            autoplayDelay: 6000,
            itemBuilder: (context, index) {
              return Image.asset(
                Consts.authImagesPaths[index],
                fit: BoxFit.fill,
              );
            },
            // control: const SwiperControl(color: Colors.black),
            autoplay: true,
            itemCount: Consts.authImagesPaths.length,
            // pagination: const SwiperPagination(
            //     alignment: Alignment.bottomCenter,
            //     builder: DotSwiperPaginationBuilder(
            //         color: Colors.white, activeColor: Colors.red)),
          ),
          Container(color: Colors.black.withOpacity(.8)),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 120,
                  ),
                  MyTextWidget(
                    text: 'Welcome back',
                    color: Colors.white,
                    textSize: 30,
                    isTitle: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MyTextWidget(
                    text: 'Sign in to continue',
                    color: Colors.white,
                    textSize: 18,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(passFocusNode),
                          controller: emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Email not valid';
                            } else {}
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () => submitForm(),
                          controller: passTextController,
                          focusNode: passFocusNode,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: secureText,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'password not valid';
                            } else {}
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    secureText = !secureText;
                                  });
                                },
                                child: Icon(
                                  secureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                )),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          GlobalMethods.navigateTo(
                              context: context,
                              routeName: ForgetPasswordScreen.routeName);
                        },
                        child: const Text(
                          'Forget password',
                          maxLines: 1,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              color: Colors.lightBlue),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthButton(
                      onPressed: () {
                        submitForm();
                        GlobalMethods.navigateTo(context: context, routeName:BottomBarScreen.routeName);
                      },
                      buttonText: 'Login'),
                  const SizedBox(
                    height: 10,
                  ),
                  const GoogleButton(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      const Expanded(
                          child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      MyTextWidget(
                          text: 'OR', color: Colors.white, textSize: 18),
                      const SizedBox(
                        width: 5,
                      ),
                      const Expanded(
                          child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AuthButton(
                    onPressed: () {},
                    buttonText: 'Continue as guest',
                    backColor: Colors.black,
                  ),
                  Row(
                    children: [
                      MyTextWidget(
                          text: "Don't have an account?",
                          color: Colors.white,
                          textSize: 18),
                      TextButton(
                          onPressed: () {
                            GlobalMethods.navigateTo(
                                context: context,
                                routeName: RegisterScreen.routeName);
                          },
                          child: MyTextWidget(
                              text: 'Sign up',
                              color: Colors.blue,
                              textSize: 18))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
