import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocey_app/inner_screens/product_details_screen.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/heart_widget.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = '1';
    // TODO: implement initState
    super.initState();
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
    return GestureDetector(
      onTap: () {
        GlobalMethods.navigateTo(
            context: context, routeName: ProductDetails.routeName);
      },
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(.05),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      height: size.width * .25,
                      width: size.width * .25,
                      child: FancyShimmerImage(
                        imageUrl:
                            'https://static.vecteezy.com/system/resources/thumbnails/008/532/596/small/kiwi-fruit-cutout-file-png.png',
                        boxFit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextWidget(
                          text: 'title',
                          color: color,
                          textSize: 24,
                          isTitle: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: size.width * .3,
                          child: Row(
                            children: [
                              _quantityController(
                                color: Colors.red,
                                icon: Icons.remove,
                                onTap: () {
                                  if(_quantityTextController.text!='0'){
                                    setState(() {
                                      _quantityTextController.text = (int.parse(
                                          _quantityTextController.text) -
                                          1)
                                          .toString();
                                    });
                                  }

                                },
                              ),
                              Flexible(
                                flex: 1,
                                child: TextField(
                                    controller: _quantityTextController,
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide())),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]')),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        if (value.isEmpty) {
                                          _quantityTextController.text = '1';
                                        } else {
                                          return;
                                        }
                                      });
                                    }),
                              ),
                              _quantityController(
                                color: Colors.green,
                                icon: Icons.add,
                                onTap: () {
                                  setState(() {
                                    _quantityTextController.text = (int.parse(
                                                _quantityTextController.text) +
                                            1)
                                        .toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: const Icon(
                              CupertinoIcons.cart_badge_minus,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const HeartWidget(),
                          MyTextWidget(
                            text: '\$50',
                            color: color,
                            textSize: 18,
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Flexible _quantityController(
      {required void Function()? onTap,
      required IconData icon,
      required Color color}) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
