import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocey_app/inner_screens/product_details_screen.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = utils.screenSize;
    final color = utils.color;
    return ListTile(
      subtitle: const Text('Paid:\$12.3'),
      onTap: () {
        GlobalMethods.navigateTo(
            context: context, routeName: ProductDetails.routeName);
      },
      leading: FancyShimmerImage(
        width: size.width * .2,
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/008/532/596/small/kiwi-fruit-cutout-file-png.png',
        boxFit: BoxFit.fill,
      ),
      title: MyTextWidget(text: 'Title x12', color: color, textSize: 18),
      trailing: MyTextWidget(text: '3/1/2023', color: color, textSize: 18),
    );
  }
}
