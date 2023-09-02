import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocey_app/services/utils.dart';
import 'package:grocey_app/widgets/back_widget.dart';
import 'package:grocey_app/widgets/feeds_items.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});
  static const routeName = '/feedsScreen';
  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final _searchController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchTextFocusNode.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.screenSize;
    final color = utils.color;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading:
        BackWidget(color: color),
        title: MyTextWidget(
          text: 'All products',
          color: color,
          textSize: 20,
          isTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  focusNode: _searchTextFocusNode,
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      hintText: 'What you think',
                      prefixIcon: const Icon(Icons.search),
                      suffix: IconButton(
                          onPressed: () {
                            _searchController.clear();
                            _searchTextFocusNode.unfocus();
                          },
                          icon: Icon(
                            Icons.close,
                            color:
                                _searchTextFocusNode.hasFocus ? Colors.red : color,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.greenAccent, width: 1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.greenAccent, width: 1)),
                      border: const OutlineInputBorder()),
                ),
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: size.width / (size.height * .61),
                ),
                itemBuilder: (context, index) => const FeedsWidget()),
          ],
        ),
      ),
    );
  }
}

