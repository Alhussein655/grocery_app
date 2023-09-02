import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocey_app/screens/orders/orders_widget.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/back_widget.dart';
import 'package:grocey_app/widgets/empty_screen.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  static const routeName = '/ordersScreen';

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Color color = utils.color;
    final size = utils.screenSize;
    bool isEmpty = true;
    return isEmpty
        ? const EmptyScreen(
            imgPath: 'assets/images/empty/empty-order.png',
            title: 'OoOps!',
            subTitle: 'you have no orders',
            btnText: 'Browse products',
          )
        : Scaffold(
            appBar: AppBar(
              leading: BackWidget(color: color),
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: MyTextWidget(
                text: 'Orders',
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
            body: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: color,
                thickness: 1,
              ),
              itemBuilder: (context, index) => const OrdersWidget(),
              itemCount: 10,
            ),
          );
  }
}
