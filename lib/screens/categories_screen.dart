import 'package:flutter/material.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/categories_widget.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class CategoriesScreen extends StatelessWidget {
   CategoriesScreen({super.key});
   List<Color> gridColors = [
     const Color(0xff53B175),
     const Color(0xffF8A44C),
     const Color(0xffF7A593),
     const Color(0xffD3B0E0),
     const Color(0xffFDE598),
     const Color(0xffB7DFF5),
   ];
  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'assets/images/cat/spinach.png',
      'catText': 'Herbs',
    },
    {
      'imgPath': 'assets/images/cat/nuts.png',
      'catText': 'Nuts',
    },
    {
      'imgPath': 'assets/images/cat/spices.png',
      'catText': 'Spices',
    },
    {
      'imgPath': 'assets/images/cat/grains.png',
      'catText': 'Grains',
    },
  ];
  @override
  Widget build(BuildContext context) {
 Utils utils=Utils(context);
 Color color=utils.color;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: MyTextWidget(text: 'Categories', color: color, textSize: 24),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: catInfo.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 24 / 25,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) =>  CategoriesWidget(
            color: gridColors[index],
            catText: catInfo[index]['catText'],
            imgPath: catInfo[index]['imgPath'],

          ),
        ),
      ),
    );
  }
}
