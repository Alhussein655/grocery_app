import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocey_app/constants/consts.dart';
import 'package:grocey_app/inner_screens/feeds_screen.dart';
import 'package:grocey_app/inner_screens/on_sale_screen.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/feeds_items.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';
import 'package:grocey_app/widgets/on_sale_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
static const routeName='homeScreen';
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.screenSize;
    final color = utils.color;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: size.height * .33,
            child: Swiper(
              itemBuilder: (context, index) {
                return Image.asset(
                  Consts.offerImagesPaths[index],
                  fit: BoxFit.fill,
                );
              },
              control: const SwiperControl(color: Colors.black),
              autoplay: true,
              itemCount:Consts.offerImagesPaths.length,
              pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white, activeColor: Colors.red)),
            ),
          ),
          const SizedBox(height: 6),
          TextButton(
              onPressed: () {
                // Navigator.pushNamed(context, OnSaleScreen.routeName);
                GlobalMethods.navigateTo(
                    context: context, routeName: OnSaleScreen.routeName);
              },
              child: MyTextWidget(
                text: 'View All',
                color: Colors.blue,
                textSize: 20,
                maxLines: 1,
              )),
          const SizedBox(height: 6),
          Row(
            children: [
              const SizedBox(width: 5),
              RotatedBox(
                quarterTurns: -1,
                child: Row(children: [
                  MyTextWidget(
                      text: 'On sale'.toUpperCase(),
                      color: Colors.red,
                      textSize: 22),
                  const SizedBox(width: 5),
                  const Icon(IconlyLight.discount, color: Colors.red)
                ]),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: SizedBox(
                  height: size.height * .24,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => const OnSaleWidget(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              MyTextWidget(
                text: 'Our product',
                color: color,
                textSize: 22,
                isTitle: true,
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    GlobalMethods.navigateTo(
                        context: context, routeName: FeedsScreen.routeName);
                  },
                  child: MyTextWidget(
                    text: 'Browse all',
                    color: Colors.blue,
                    textSize: 20,
                    maxLines: 1,
                  )),
            ]),
          ),
          GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: size.width / (size.height * .61),
              ),
              itemBuilder: (context, index) => const FeedsWidget()),
        ]),
      ),
    );
  }
}
