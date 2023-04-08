import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zul_restaurant_app/model/Restaurant.dart';
import 'package:zul_restaurant_app/modules/detail_restaurant/detail_restaurant.dart';
import 'package:zul_restaurant_app/platform_widget.dart';

class ListRestaurantScreen extends StatefulWidget {
  const ListRestaurantScreen({Key? key}) : super(key: key);

  @override
  State<ListRestaurantScreen> createState() => _ListRestaurantScreenState();
}

class _ListRestaurantScreenState extends State<ListRestaurantScreen> {
  topTitleWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Daftar Restoran',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Daftar Rekomendasi Restoran Terbaik',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }

  getItemRestaurantWidget({name, location, rating, photoRestaurant, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 150,
            margin: const EdgeInsets.only(left: 15, bottom: 5),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(photoRestaurant), fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                )),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 19),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
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
                      location,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icon/star.png',
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  parseRestaurants(source) {
    if (source == null) {
      return [];
    }

    var parsedJson = json.decode(source);
    List restaurants = parsedJson['restaurants'];

    return restaurants.map((item) => Restaurant.fromJson(item)).toList();
  }

  listRestaurantWidget() {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/data/restaurants.json'),
      builder: (context, snapshot) {
        var restaurants = parseRestaurants(snapshot.data);
        return ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = restaurants[index];
              return getItemRestaurantWidget(
                  name: restaurant.name,
                  location: restaurant.location,
                  rating: restaurant.rating,
                  photoRestaurant: restaurant.restaurantPhoto,
                  onTap: () {
                    Navigator.pushNamed(
                        context, DetailRestaurantScreen.routeName,
                        arguments: restaurant);
                    // Navigator.pushNamed(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => DetailRestaurantScreen(),
                    //     ));
                  });
            });
      },
    );
  }

  Widget _androidBuilder(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 10,
          ),
          topTitleWidget(),
          const SizedBox(
            height: 10,
          ),
          Expanded(child: listRestaurantWidget())
        ],
      ),
    ));
  }

  Widget _iosBuilder(BuildContext context) {
    return CupertinoPageScaffold(child: listRestaurantWidget());
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        androidBuilder: _androidBuilder, iosBuilder: _iosBuilder);
  }
}
