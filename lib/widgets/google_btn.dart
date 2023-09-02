import 'package:flutter/material.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.blue,
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                color: Colors.white,
                child: Image.asset('assets/images/GOOG.png',width: 40,)),
            const SizedBox(width: 8,),
            MyTextWidget(text: 'Sign in with google', color: Colors.white, textSize: 18)
          ],
        ),
      ),
    );
  }
}
