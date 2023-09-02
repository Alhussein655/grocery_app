import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocey_app/constants/consts.dart';
import 'package:grocey_app/screens/auth/login_screen.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/auth_btn.dart';
import 'package:grocey_app/widgets/google_btn.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const routeName = '/registerScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final passFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final addressFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool secureText = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailTextController.dispose();
    nameTextController.dispose();
    addressTextController.dispose();
    passTextController.dispose();
    passFocusNode.dispose();
    addressFocusNode.dispose();
    emailFocusNode.dispose();
  }

  void submitForm() {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      formKey.currentState!.save();
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 25,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  MyTextWidget(
                    text: 'Welcome',
                    color: Colors.white,
                    textSize: 30,
                    isTitle: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MyTextWidget(
                    text: 'Sign up to continue',
                    color: Colors.white,
                    textSize: 18,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(emailFocusNode),
                          controller: nameTextController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty && value.length > 3) {
                              return 'name not valid';
                            } else {}
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'Full name',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          focusNode: emailFocusNode,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(passFocusNode),
                          controller: emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty && value.length > 3) {
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
                        const SizedBox(height: 20),
                        TextFormField(
                          focusNode: passFocusNode,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(addressFocusNode),
                          controller: passTextController,
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
                        const SizedBox(height: 20),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () => submitForm(),
                          controller: addressTextController,
                          focusNode: addressFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty && value.length > 3) {
                              return 'address not valid';
                            } else {}
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'Shopping address',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  AuthButton(onPressed: () {}, buttonText: 'Sign up'),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      MyTextWidget(
                          text: "Already have an account?",
                          color: Colors.white,
                          textSize: 18),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: MyTextWidget(
                              text: 'Sign in',
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
