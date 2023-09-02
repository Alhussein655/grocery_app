import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocey_app/constants/consts.dart';
import 'package:grocey_app/screens/auth/register_screen.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/widgets/auth_btn.dart';
import 'package:grocey_app/widgets/back_widget.dart';
import 'package:grocey_app/widgets/google_btn.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  static const routeName = '/forgetPasswordScreen';

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailTextController = TextEditingController();

  bool secureText = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailTextController.dispose();
  }

  void forgetPasswordFun() async {}
  @override
  Widget build(BuildContext context) {
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
                    height: 50,
                  ),
                  const BackWidget(color: Colors.white),
                  const SizedBox(
                    height: 50,
                  ),
                  MyTextWidget(
                    text: 'Forget password',
                    color: Colors.white,
                    textSize: 30,
                    isTitle: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    textInputAction: TextInputAction.done,
                    controller: emailTextController,
                    keyboardType: TextInputType.emailAddress,
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
                  const SizedBox(
                    height: 10,
                  ),
                  AuthButton(
                      onPressed: () {
                        if (emailTextController.text.isEmpty &&
                            !emailTextController.text.contains('@')) {
                          GlobalMethods.showCustomDialog(
                              title: 'Error occurred',
                              content: 'Please enter a valid email ',
                              hasText: false,
                              onPressed: () {
                                Navigator.pop(context);

                              },
                              color: Colors.black,
                              context: context);
                        }
                      },
                      buttonText: 'Reset password'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
