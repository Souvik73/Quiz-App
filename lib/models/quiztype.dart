// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<QuizType> welcomeFromJson(String str) => List<QuizType>.from(json.decode(str).map((x) => QuizType.fromJson(x)));

String welcomeToJson(List<QuizType> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizType {
    QuizType({
        required this.id,
        required this.name,
        required this.apilink,
        required this.img,
    });

    String id;
    String name;
    String apilink;
    String img;

    factory QuizType.fromJson(Map<String, dynamic> json) => QuizType(
        id: json["id"],
        name: json["name"],
        apilink: json["apilink"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "apilink": apilink,
        "img": img,
    };
}
