class FoodModel {
  final List<Hotel>? hotels;

  FoodModel({
    this.hotels,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        hotels: json["hotels"] == null
            ? []
            : List<Hotel>.from(json["hotels"]!.map((x) => Hotel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hotels": hotels == null
            ? []
            : List<dynamic>.from(hotels!.map((x) => x.toJson())),
      };
}

class Hotel {
  final String? name;
  final String? image;
  final int? pricePerPerson;
  final int? rating;
  final List<Menu>? menu;

  Hotel({
    this.name,
    this.image,
    this.pricePerPerson,
    this.rating,
    this.menu,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        name: json["name"],
        image: json["image"],
        pricePerPerson: json["price_per_person"],
        menu: json["menu"] == null
            ? []
            : List<Menu>.from(json["menu"]!.map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "price_per_person": pricePerPerson,
        "menu": menu == null
            ? []
            : List<dynamic>.from(menu!.map((x) => x.toJson())),
      };
}

class Menu {
  final String? item;
  final int? price;

  Menu({
    this.item,
    this.price,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        item: json["item"],
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "item": item,
        "price": price,
      };
}
