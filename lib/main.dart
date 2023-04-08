import 'package:flutter/material.dart';
import 'package:zul_restaurant_app/model/Restaurant.dart';
import 'package:zul_restaurant_app/modules/detail_restaurant/detail_restaurant.dart';
import 'package:zul_restaurant_app/modules/list_restaurant.dart/view/list_restaurant_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListRestaurantScreen(),
      routes: {
        DetailRestaurantScreen.routeName: (context) => DetailRestaurantScreen(
              arguments:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            )
      },
    );
  }
}
