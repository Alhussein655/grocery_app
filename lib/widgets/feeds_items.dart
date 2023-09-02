import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocey_app/inner_screens/product_details_screen.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/heart_widget.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';
import 'package:grocey_app/widgets/price_widget.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({super.key});

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quantityTextController.text = '1';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _quantityTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = utils.screenSize;
    final color = utils.color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            GlobalMethods.navigateTo(
                context: context, routeName: ProductDetails.routeName);
          },
          child: Column(
            children: [
              FancyShimmerImage(
                imageUrl:
                    'https://static.vecteezy.com/system/resources/thumbnails/008/532/596/small/kiwi-fruit-cutout-file-png.png',
                height: size.width * .2,
                boxFit: BoxFit.fill,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyTextWidget(
                          text: 'title',
                          color: color,
                          textSize: 20,
                          isTitle: true,
                        ),
                        const HeartWidget()
                      ])),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 4,
                          child: PriceWidget(
                            isOnSale: true,
                            price: 5.9,
                            salePrice: 2.99,
                            textPrice: _quantityTextController.text,
                          ),
                        ),
                        const SizedBox(width: 3),
                        Flexible(
                            child: Row(children: [
                          Flexible(
                            flex: 3,
                            child: FittedBox(
                                child: MyTextWidget(
                              text: 'kg',
                              color: color,
                              textSize: 18,
                              isTitle: true,
                            )),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                              flex: 2,
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: _quantityTextController,
                                key: const ValueKey('10'),
                                style: TextStyle(color: color, fontSize: 18),
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                enabled: true,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9.]')),
                                ],
                              ))
                        ])),
                      ])),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).cardColor),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12))))),
                    onPressed: () {},
                    child: MyTextWidget(
                      text: 'Add to cart',
                      color: color,
                      textSize: 20,
                      maxLines: 1,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
