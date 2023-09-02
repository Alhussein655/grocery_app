import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocey_app/screens/cart/cart_widget.dart';
import 'package:grocey_app/widgets/empty_screen.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = utils.screenSize;
    final color = utils.color;
    bool isEmpty=true;
    return isEmpty? const EmptyScreen(
      imgPath: 'assets/images/empty/empty_cart.png',
      title:  'Whoops!!',
      subTitle: 'No items in your cart yet',
      btnText: 'Browse products',
    ): Scaffold(
      appBar:
      AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: MyTextWidget(
          text: 'Cart(2)',
          color: color,
          textSize: 22,
          isTitle: true,
        ),
        actions: [
          IconButton(
              onPressed: () {
                GlobalMethods.showCustomDialog(
                    color: color,
                    context: context,
                    hasText: false,
                    title: 'Remove All',
                    content: 'Are you sure!');
              },
              icon: Icon(
                IconlyLight.delete,
                color: color,
              ))
        ],
      ),
      body:Column(
        children: [
          _checkOut(context: context),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => const CartWidget(),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _checkOut({required BuildContext context}) {
    Utils utils = Utils(context);
    Size size = utils.screenSize;
    final color = utils.color;
    return SizedBox(
      width: double.infinity,
      height: size.height * .1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextWidget(
                      text: 'Order Now', color: Colors.white, textSize: 20),
                ),
              ),
            ),
            const Spacer(),
            FittedBox(
              child: MyTextWidget(
                text: 'Total: \$.259',
                color: color,
                textSize: 18,
                isTitle: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
