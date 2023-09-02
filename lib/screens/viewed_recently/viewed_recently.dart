import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocey_app/screens/viewed_recently/viewed_widget.dart';
import 'package:grocey_app/services/global_methods.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/back_widget.dart';
import 'package:grocey_app/widgets/empty_screen.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  const ViewedRecentlyScreen({super.key});
  static const routeName = '/viewedRecentlyScreen';

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Color color = utils.color;
    final size = utils.screenSize;
    bool isEmpty=true;
    return
      isEmpty? const EmptyScreen(
        imgPath: 'assets/images/empty/history.png',
        title:  'history is empty!',
        subTitle: 'no products have been viewed',
        btnText: 'Browse products',
      ):
      Scaffold(
      appBar: AppBar(
        leading: BackWidget(color: color),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: MyTextWidget(
          text: 'History',
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
      body: ListView.builder(
        itemBuilder: (context, index) => const ViewedRecentlyWidget(),
        itemCount: 10,
      ),
    );
  }
}
