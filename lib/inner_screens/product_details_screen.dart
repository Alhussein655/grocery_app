import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/heart_widget.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});
  static const routeName = '/productDetails';
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _quantityTextController = TextEditingController(text: '1');
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _quantityTextController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = utils.screenSize;
    final color = utils.color;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
            size: 24,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: FancyShimmerImage(
              imageUrl:
                  'https://static.vecteezy.com/system/resources/thumbnails/008/532/596/small/kiwi-fruit-cutout-file-png.png',
              width: size.width,
              boxFit: BoxFit.scaleDown,
            ),
          ),
          Flexible(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: MyTextWidget(
                            text: 'title',
                            color: color,
                            textSize: 25,
                            isTitle: true,
                          )),
                          const HeartWidget()
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyTextWidget(
                            text: '\$2.59',
                            color: Colors.green,
                            textSize: 22,
                            isTitle: true,
                          ),
                          MyTextWidget(
                            text: 'kg',
                            color: color,
                            textSize: 12,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Visibility(
                              visible: true,
                              child: Text(
                                '\$3.9',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: color,
                                    decoration: TextDecoration.lineThrough),
                              )),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(63, 200, 101, 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: MyTextWidget(
                              text: 'Free delivery',
                              color: Colors.white,
                              textSize: 20,
                              isTitle: true,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _quantityController(
                            onTap: () {
                              if (_quantityTextController.text != '0') {
                                setState(() {
                                  _quantityTextController.text =
                                      (int.parse(_quantityTextController.text) -
                                              1)
                                          .toString();
                                });
                              }
                            },
                            icon: Icons.remove,
                            color: Colors.red),
                        Flexible(
                            flex: 1,
                            child: TextField(
                              controller: _quantityTextController,
                              key: const ValueKey('quantity'),
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                              ),
                              textAlign: TextAlign.center,
                              cursorColor: Colors.green,
                              enabled: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                              onChanged: (value) {
                                setState(() {
                                  if (value.isEmpty) {
                                    _quantityTextController.text = '1';
                                  } else {}
                                });
                              },
                            )),
                        _quantityController(
                            onTap: () {
                              setState(() {
                                _quantityTextController.text =
                                    (int.parse(_quantityTextController.text) +
                                            1)
                                        .toString();
                              });
                            },
                            icon: Icons.add,
                            color: Colors.green),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextWidget(
                                text: 'Total',
                                color: Colors.red.shade300,
                                textSize: 20,
                                isTitle: true,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    MyTextWidget(
                                      text: '\$2.59/',
                                      color: Colors.green,
                                      textSize: 20,
                                      isTitle: true,
                                    ),
                                    MyTextWidget(
                                      text: ' ${ _quantityTextController.text} kg',
                                      color: color,
                                      textSize: 16,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                          const SizedBox(
                            width: 8,
                          ),
                          Flexible(
                              child: Material(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: MyTextWidget(
                                    text: 'Add to card',
                                    color: Colors.white,
                                    textSize: 18),
                              ),
                            ),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              )),
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
