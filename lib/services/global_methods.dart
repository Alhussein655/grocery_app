import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocey_app/services/utils.dart';

class GlobalMethods {
  static navigateTo({required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }
 static Future<void> showCustomDialog(
      {void Function()? onPressed,
        bool hasText = true,
        required Color color,
        String? title,
        String? content,
        String? hint,
        String? textBtn1,
        String? textBtn2,
      required BuildContext context,
       TextEditingController? textController}) async {

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: hasText
              ? null
              : Row(
            children: [
              Image.asset(
                'assets/images/status-warning-icon-png-29.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(title ?? ''),
            ],
          ),
          content: hasText
              ? TextField(
            onChanged: (value) {
              value = textController!.text;
            },
            controller: textController,
            maxLines: 2,
            decoration: InputDecoration(hintText: hint ?? ''),
          )
              : Text(content!),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  textBtn1 ?? '',
                  style: const TextStyle(color: Colors.red),
                )),
            TextButton(
                onPressed: onPressed,
                child: Text(
                  textBtn2 ?? 'ok',
                  style: TextStyle(color: color),
                )),
          ],
        );
      },
    );
  }
}
