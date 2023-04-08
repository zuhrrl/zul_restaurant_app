import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zul_restaurant_app/model/Restaurant.dart';
import 'package:zul_restaurant_app/platform_widget.dart';

class DetailRestaurantScreen extends StatelessWidget {
  static var routeName = '/detail_restaurant_screen';
  final Restaurant? arguments;
  const DetailRestaurantScreen({Key? key, this.arguments}) : super(key: key);

  parseFoods(source) {
    if (source == null) {
      return [];
    }

    var parsedJson = json.decode(source);
    List food = parsedJson['food'];

    return food.map((item) => Food.fromJson(item)).toList();
  }

  Widget _androidBuilder(BuildContext context) {
    Restaurant restaurant = arguments!;

    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Container(
            height: 200,
            width: 150,
            margin:
                const EdgeInsets.only(left: 15, bottom: 5, right: 15, top: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(restaurant.restaurantPhoto),
                    fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text(
              restaurant.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icon/location.png',
                  height: 18,
                  width: 18,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  restaurant.location,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Text(restaurant.description),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              'Daftar Menu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: arguments!.menus.foods.length,
              itemBuilder: (context, index) {
                Food food = Food.fromJson(arguments!.menus.foods[index]);
                return Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 0.3,
                            spreadRadius: 1,
                            offset: const Offset(3, 0))
                      ],
                      color: Colors.grey,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        const Spacer(),
                        const Spacer(),
                        Text(
                          food.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Expanded(
                            child: Text(
                          'Makanan',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
            child: GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: arguments!.menus.drinks.length,
              itemBuilder: (context, index) {
                Drink drink = Drink.fromJson(arguments!.menus.drinks[index]);
                return Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 0.3,
                            spreadRadius: 1,
                            offset: const Offset(3, 0))
                      ],
                      color: Colors.grey,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        const Spacer(),
                        const Spacer(),
                        Text(
                          drink.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Expanded(
                            child: Text(
                          'Minuman',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ))
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }

  Widget _iosBuilder(BuildContext context) {
    Restaurant restaurant = arguments!;

    return CupertinoPageScaffold(
        child: SafeArea(
      child: ListView(
        children: [
          Container(
            height: 200,
            width: 150,
            margin:
                const EdgeInsets.only(left: 15, bottom: 5, right: 15, top: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(restaurant.restaurantPhoto),
                    fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text(
              restaurant.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icon/location.png',
                  height: 18,
                  width: 18,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  restaurant.location,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Text(restaurant.description),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              'Daftar Menu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: arguments!.menus.foods.length,
              itemBuilder: (context, index) {
                Food food = Food.fromJson(arguments!.menus.foods[index]);
                return Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 0.3,
                            spreadRadius: 1,
                            offset: const Offset(3, 0))
                      ],
                      color: Colors.grey,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        const Spacer(),
                        const Spacer(),
                        Text(
                          food.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Expanded(
                            child: Text(
                          'Makanan',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
            child: GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: arguments!.menus.drinks.length,
              itemBuilder: (context, index) {
                Drink drink = Drink.fromJson(arguments!.menus.drinks[index]);
                return Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 0.3,
                            spreadRadius: 1,
                            offset: const Offset(3, 0))
                      ],
                      color: Colors.grey,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        const Spacer(),
                        const Spacer(),
                        Text(
                          drink.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Expanded(
                            child: Text(
                          'Minuman',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ))
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        androidBuilder: _androidBuilder, iosBuilder: _iosBuilder);
  }
}
