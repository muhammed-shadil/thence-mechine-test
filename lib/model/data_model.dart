

import 'dart:convert';

Fetchdata fetchdataFromMap(String str) => Fetchdata.fromMap(json.decode(str));

String fetchdataToMap(Fetchdata data) => json.encode(data.toMap());
class Fetchdata {
    List<Datum> data;

    Fetchdata({
        required this.data,
    });

    factory Fetchdata.fromMap(Map<String, dynamic> json) => Fetchdata(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Datum {
    int id;
    int categoryId;
    String imageUrl;
    String name;
    double rating;
    int displaySize;
    List<int> availableSize;
    String unit;
    String price;
    String priceUnit;
    String description;

    Datum({
        required this.id,
        required this.categoryId,
        required this.imageUrl,
        required this.name,
        required this.rating,
        required this.displaySize,
        required this.availableSize,
        required this.unit,
        required this.price,
        required this.priceUnit,
        required this.description,
    });

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        categoryId: json["category_id"],
        imageUrl: json["image_url"],
        name: json["name"],
        rating: json["rating"]?.toDouble(),
        displaySize: json["display_size"],
        availableSize: List<int>.from(json["available_size"].map((x) => x)),
        unit: json["unit"],
        price: json["price"],
        priceUnit: json["price_unit"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "category_id": categoryId,
        "image_url": imageUrl,
        "name": name,
        "rating": rating,
        "display_size": displaySize,
        "available_size": List<dynamic>.from(availableSize.map((x) => x)),
        "unit": unit,
        "price": price,
        "price_unit": priceUnit,
        "description": description,
    };
}
