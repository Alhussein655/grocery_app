import 'package:flutter/material.dart';
import 'package:grocey_app/constants/theme_Data.dart';
import 'package:grocey_app/inner_screens/feeds_screen.dart';
import 'package:grocey_app/inner_screens/on_sale_screen.dart';
import 'package:grocey_app/inner_screens/product_details_screen.dart';
import 'package:grocey_app/provider/dark_theme_provider.dart';
import 'package:grocey_app/screens/auth/forget_password_screen.dart';
import 'package:grocey_app/screens/auth/login_screen.dart';
import 'package:grocey_app/screens/auth/register_screen.dart';
import 'package:grocey_app/screens/bottom_bar_screen.dart';
import 'package:grocey_app/screens/home_screen.dart';
import 'package:grocey_app/screens/orders/ordres_screen.dart';
import 'package:grocey_app/screens/viewed_recently/viewed_recently.dart';
import 'package:grocey_app/screens/wish_list/wishlist_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
            routes: {
              BottomBarScreen.routeName: (context) => const BottomBarScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
              OnSaleScreen.routeName: (context) => const OnSaleScreen(),
              FeedsScreen.routeName: (context) => const FeedsScreen(),
              ProductDetails.routeName: (context) => const ProductDetails(),
              WishlistScreen.routeName: (context) => const WishlistScreen(),
              OrdersScreen.routeName: (context) => const OrdersScreen(),
              ViewedRecentlyScreen.routeName: (context) => const ViewedRecentlyScreen(),
              LoginScreen.routeName: (context) => const LoginScreen(),
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
            },
            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const LoginScreen());
      }),
    );
  }
}
