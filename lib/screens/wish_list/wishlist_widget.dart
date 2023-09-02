import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocey_app/inner_screens/product_details_screen.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/heart_widget.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = utils.screenSize;
    final color = utils.color;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
          onTap: () {
            GlobalMethods.navigateTo(
                context: context, routeName: ProductDetails.routeName);
          },
          child: Container(
            height: size.height * .2,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                border: Border.all(color: color, width: .5),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  width: size.width * .2,
                  height: size.width * .25,
                  child: FancyShimmerImage(
                    imageUrl:
                        'https://e7.pngegg.com/pngimages/467/70/png-clipart-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-thumbnail.png',
                    boxFit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                IconlyLight.bag2,
                                color: color,
                              )),
                          const HeartWidget()
                        ],
                      ),
                    ),
                    Flexible(
                        child: MyTextWidget(
                      text: 'title',
                      color: color,
                      textSize: 20,
                      maxLines: 2,
                      isTitle: true,
                    )),
                    const SizedBox(
                       height: 5,
                    ),
                    MyTextWidget(
                      text: '\$20.2',
                      color: color,
                      textSize: 18,
                      maxLines: 1,
                      isTitle: true,
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
