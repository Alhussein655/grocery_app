import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocey_app/screens/wish_list/wishlist_widget.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/back_widget.dart';
import 'package:grocey_app/widgets/empty_screen.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  static const routeName = '/wishlistScreen';

  @override
  Widget build(BuildContext context) {
    bool isEmpty=true;
    Utils utils = Utils(context);
    Size size = utils.screenSize;
    final color = utils.color;
    return isEmpty?const EmptyScreen(
        imgPath: 'assets/images/empty/empty_wishlist.png',
        title:  'Whoops!',
        subTitle: 'No wishes yet',
        btnText: 'Browse products',
    ):Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: BackWidget(color: color),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: MyTextWidget(
            text: 'Wishlist',
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
        body:MasonryGridView.count(
          crossAxisCount: 2,
          // mainAxisSpacing: 16,
          // crossAxisSpacing: 20,
          itemBuilder: (context, index) {
            return const WishlistWidget();
          },
        ));
  }
}
