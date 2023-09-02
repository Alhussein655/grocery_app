import 'package:flutter/material.dart';
import 'package:grocey_app/inner_screens/feeds_screen.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen(
      {super.key,
      required this.imgPath,
      required this.title,
      required this.subTitle,
      required this.btnText});
  final String imgPath, title, subTitle, btnText;

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = utils.screenSize;
    final color = utils.color;
    final themeState = utils.getTheme;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: color,
                      size: 25,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: size.width * .15,
          ),
          Image.asset(
            imgPath,
            width: double.infinity,
            height: size.height * .30,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextWidget(
              text: subTitle,
              color: themeState ? Colors.cyan : Colors.grey.shade600,
              textSize: 20),
          SizedBox(
            height: size.width * .22,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: color,
                elevation: 0,
                backgroundColor: themeState
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.background,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    )),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              onPressed: () {
                GlobalMethods.navigateTo(
                    context: context, routeName: FeedsScreen.routeName);
              },
              child: MyTextWidget(
                text: btnText,
                color: themeState ? Colors.grey.shade300 : Colors.grey.shade900,
                textSize: 20,
                isTitle: true,
              ))
        ]),
      )),
    );
  }
}
