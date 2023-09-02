import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class MyListTile extends StatelessWidget {
  MyListTile(
      {super.key,
        this.title,
        this.subTitle,
        this.trailing,
        this.leading,
        this.onTap});
  String? title, subTitle;
  IconData? leading, trailing;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title ?? '',
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subTitle ?? ''),
      leading: Icon(leading),
      trailing: Icon(trailing ?? IconlyLight.arrowRight2),
      onTap: onTap,
    );
  }
}
