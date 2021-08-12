// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<QuesAndAns> welcomeFromJson(String str) => List<QuesAndAns>.from(json.decode(str).map((x) => QuesAndAns.fromJson(x)));

String welcomeToJson(List<QuesAndAns> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuesAndAns {
    QuesAndAns({
        required this.q,
        required this.o1,
        required this.o2,
        required this.o3,
        required this.o4,
        required this.co,
    });

    String q;
    String o1;
    String o2;
    String o3;
    String o4;
    String co;

    factory QuesAndAns.fromJson(Map<String, dynamic> json) => QuesAndAns(
        q: json["q"],
        o1: json["o1"],
        o2: json["o2"],
        o3: json["o3"],
        o4: json["o4"],
        co: json["co"],
    );

    Map<String, dynamic> toJson() => {
        "q": q,
        "o1": o1,
        "o2": o2,
        "o3": o3,
        "o4": o4,
        "co": co,
    };
}
