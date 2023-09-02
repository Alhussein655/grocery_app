import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocey_app/inner_screens/product_details_screen.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/heart_widget.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';
import 'package:grocey_app/widgets/price_widget.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = utils.screenSize;
    final theme = utils.getTheme;
    final color = utils.color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            GlobalMethods.navigateTo(
                context: context, routeName: ProductDetails.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FancyShimmerImage(
                      imageUrl:
                      'https://static.vecteezy.com/system/resources/thumbnails/008/532/596/small/kiwi-fruit-cutout-file-png.png',
                      height: size.width * .22,
                      width: size.width * .22,
                      boxFit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        MyTextWidget(
                          text: '1 kg',
                          color: color,
                          textSize: 22,
                          isTitle: true,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.bag2,
                                size: 22,
                                color: color,
                              ),
                            ),
                      const HeartWidget()
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                 const PriceWidget(
                   isOnSale: true,
                   price: 5.9,
                   salePrice: 2.99,
                   textPrice:'1',
                 ),
                const SizedBox(
                  height: 5,
                ),
                MyTextWidget(
                  text: 'product Title',
                  color: color,
                  textSize: 16,
                  isTitle: true,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
