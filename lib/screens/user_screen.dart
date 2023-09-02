import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocey_app/provider/dark_theme_provider.dart';
import 'package:grocey_app/screens/orders/ordres_screen.dart';
import 'package:grocey_app/screens/viewed_recently/viewed_recently.dart';
import 'package:grocey_app/screens/wish_list/wishlist_screen.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/widgets/my_list_tile.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController addressTextController =
      TextEditingController(text: '');
  @override
  void dispose() {
    // TODO: implement dispose
    addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    Future<void> showCustomDialog(
        {void Function()? onPressed,
        bool hasText = true,
        String? title,
        String? content,
        String? hint,
        String? textBtn1,
        String? textBtn2}) async {
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: hasText
                ? null
                : Row(
                    children: [
                      Image.asset(
                        'assets/images/status-warning-icon-png-29.png',
                        height: 20,
                        width: 20,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(title ?? ''),
                    ],
                  ),
            content: hasText
                ? TextField(
                    onChanged: (value) {
                      value = addressTextController.text;
                    },
                    controller: addressTextController,
                    maxLines: 2,
                    decoration: InputDecoration(hintText: hint ?? ''),
                  )
                : Text(content!),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    textBtn1 ?? 'cancel',
                    style: const TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: onPressed,
                  child: Text(
                    textBtn2 ?? 'ok',
                    style: TextStyle(color: color),
                  )),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Hi, ',
                      style: const TextStyle(
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                          fontSize: 27),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'My name',
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.normal,
                                fontSize: 27),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ]),
                ),
                const SizedBox(
                  height: 5,
                ),
                MyTextWidget(text: 'mail@mail.com', color: color, textSize: 16),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  indent: 2,
                  endIndent: 2,
                  color: color,
                  thickness: .3,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyListTile(
                  title: 'Address',
                  subTitle: 'my address',
                  leading: IconlyLight.profile,
                  onTap: () {
                    GlobalMethods.showCustomDialog(
                      textController: addressTextController,
                      color: color,
                      context: context,
                      title: 'Address',
                      hint: 'update...',
                    );
                  },
                ),
                MyListTile(
                  title: 'Orders',
                  leading: IconlyLight.bag,
                  onTap: () {
                    GlobalMethods.navigateTo(
                        context: context, routeName: OrdersScreen.routeName);
                  },
                ),
                MyListTile(
                  title: 'Wishlist',
                  leading: IconlyLight.heart,
                  onTap: () {
                    GlobalMethods.navigateTo(
                        context: context, routeName: WishlistScreen.routeName);
                  },
                ),
                MyListTile(
                  title: 'Forget password',
                  leading: IconlyLight.lock,
                  onTap: () {},
                ),
                MyListTile(
                  title: 'Viewed',
                  leading: IconlyLight.show,
                  onTap: () {
                    GlobalMethods.navigateTo(
                        context: context,
                        routeName: ViewedRecentlyScreen.routeName);
                  },
                ),
                SwitchListTile(
                  activeColor: Colors.blue,
                  inactiveThumbColor: Colors.black,
                  title: MyTextWidget(
                    text: 'Theme',
                    color:
                        themeState.getDarkTheme ? Colors.white : Colors.black,
                    textSize: 24,
                    isTitle: true,
                  ),
                  secondary: themeState.getDarkTheme
                      ? const Icon(Icons.dark_mode_outlined)
                      : const Icon(Icons.light_mode_outlined),
                  value: themeState.getDarkTheme,
                  onChanged: (value) {
                    themeState.setDarkTheme = value;
                  },
                ),
                MyListTile(
                  title: 'Log out',
                  leading: IconlyLight.logout,
                  onTap: () {
                    GlobalMethods.showCustomDialog(
                        color: color,
                        context: context,
                        hasText: false,
                        title: 'Sign out',
                        content: 'do you wanna sign out?');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
