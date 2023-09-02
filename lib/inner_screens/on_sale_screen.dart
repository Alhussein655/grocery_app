import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/back_widget.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';
import 'package:grocey_app/widgets/on_sale_widget.dart';

class OnSaleScreen extends StatelessWidget {
  const OnSaleScreen({super.key});
  static const routeName = '/onSaleScreen';
  @override
  Widget build(BuildContext context) {
    bool _isEmpty = false;
    final Utils utils = Utils(context);
    Size size = utils.screenSize;
    final color = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading:
        BackWidget(color: color),
        title: MyTextWidget(
          text: 'Product on sale',
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: _isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'No products yet!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset('assets/images/empty_box.png',scale: 2,),
                  ),
                  const Text(
                    'Stay tuned.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          :
      GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: 16,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: size.width / (size.height * .46),
              ),
              itemBuilder: (context, index) => const OnSaleWidget()),
    );
  }
}
