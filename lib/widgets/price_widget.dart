import 'package:flutter/material.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {super.key,
      required this.salePrice,
      required this.price,
      required this.textPrice,
      required this.isOnSale});
  final double salePrice, price;
  final String textPrice;
  final bool isOnSale;

  @override
  Widget build(BuildContext context) {
    double usedPrice = isOnSale ? salePrice : price;
    Utils utils = Utils(context);
    final color = utils.color;
    return FittedBox(
      child: Row(children: [
        MyTextWidget(
            text: '\$${(usedPrice * int.parse(textPrice)).toStringAsFixed(2)}',
            color: Colors.green,
            textSize: 18),
        const SizedBox(
          width: 5,
        ),
        Visibility(
          visible: isOnSale?true:false,
          child: Text(
            '\$${(price * int.parse(textPrice)).toStringAsFixed(2)}',
            style: TextStyle(
                fontSize: 15,
                color: color,
                decoration: TextDecoration.lineThrough),
          ),
        )
      ]),
    );
  }
}
