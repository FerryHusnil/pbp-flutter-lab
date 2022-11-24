// To parse this JSON data, do
//
//     final myWatchlist = myWatchlistFromJson(jsonString);

import 'dart:convert';

List<MyWatchlist> myWatchlistFromJson(String str) => List<MyWatchlist>.from(json.decode(str).map((x) => MyWatchlist.fromJson(x)));

String myWatchlistToJson(List<MyWatchlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchlist {
    MyWatchlist({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model model;
    int pk;
    Fields fields;

    factory MyWatchlist.fromJson(Map<String, dynamic> json) => MyWatchlist(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.title,
        required this.rating,
        required this.releaseDate,
        required this.watched,
        required this.review,
    });

    String title;
    int rating;
    DateTime releaseDate;
    bool watched;
    String review;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["title"],
        rating: json["rating"],
        releaseDate: DateTime.parse(json["release_date"]),
        watched: json["watched"],
        review: json["review"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "rating": rating,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "watched": watched,
        "review": review,
    };
}

enum Model { mywatchlistMywatchlist }

final modelValues = EnumValues({
    "mywatchlist.mywatchlist": Model.mywatchlistMywatchlist
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        return reverseMap;
    }
}
