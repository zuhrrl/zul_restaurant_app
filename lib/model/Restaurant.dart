class Restaurant {
  final String name;
  final String restaurantPhoto;
  final String description;
  final String location;
  final num rating;
  final Menus menus;

  Restaurant(
      {required this.name,
      required this.description,
      required this.restaurantPhoto,
      required this.location,
      required this.rating,
      required this.menus});

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) => Restaurant(
      name: restaurant['name'],
      description: restaurant['description'],
      restaurantPhoto: restaurant['pictureId'],
      location: restaurant['city'],
      rating: restaurant['rating'],
      menus: Menus.fromJson(restaurant['menus']));
}

class Menus {
  late List<dynamic> foods;
  late List<dynamic> drinks;

  Menus({required this.foods, required this.drinks});

  Menus.fromJson(Map<String, dynamic> menus) {
    foods = menus['foods'];
    drinks = menus['drinks'];
  }
}

class Food {
  final String name;
  Food({required this.name});

  factory Food.fromJson(Map<String, dynamic> food) => Food(name: food['name']);
}

class Drink {
  final String name;
  Drink({required this.name});

  factory Drink.fromJson(Map<String, dynamic> food) =>
      Drink(name: food['name']);
}
