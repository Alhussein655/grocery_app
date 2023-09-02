import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocey_app/inner_screens/product_details_screen.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class ViewedRecentlyWidget extends StatefulWidget {
  const ViewedRecentlyWidget({super.key});

  @override
  State<ViewedRecentlyWidget> createState() => _ViewedRecentlyWidgetState();
}

class _ViewedRecentlyWidgetState extends State<ViewedRecentlyWidget> {
  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = utils.screenSize;
    final color = utils.color;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          GlobalMethods.navigateTo(
              context: context, routeName: ProductDetails.routeName);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FancyShimmerImage(
              width: size.width * .25,
              height: size.width * .27,
              imageUrl:
                  'https://static.vecteezy.com/system/resources/thumbnails/008/532/596/small/kiwi-fruit-cutout-file-png.png',
              boxFit: BoxFit.fill,
            ),
            const SizedBox(width: 12,),
            Column(children: [
              MyTextWidget(
                text: 'Title',
                color: color,
                textSize: 22,
                isTitle: true,
              ),
              const Text('\$12.3'),
            ],),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Material(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.add,color: Colors.white,size: 20,),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
