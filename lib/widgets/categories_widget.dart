import 'package:flutter/material.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {super.key,
      required this.color,
      required this.catText,
      required this.imgPath});
  final String catText, imgPath;
  final Color color;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    // final themeState = Provider.of<DarkThemeProvider>(context);
    // final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    Utils utils = Utils(context);
    final Color textColor = utils.color;
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(.2),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(.7), width: 2),
        ),
        child: Column(
          children: [
            SizedBox(
              height: screenWidth * .05,
            ),
            Container(
              height: screenWidth * .3,
              width: screenWidth * .3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.fill)),
            ),
            SizedBox(
              height: screenWidth * .02,
            ),
            MyTextWidget(
              text: catText,
              color: textColor,
              textSize: 20,
              isTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
