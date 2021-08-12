import 'dart:convert';

List<QuesAndAns1> welcomeFromJson(String str) => List<QuesAndAns1>.from(json.decode(str).map((x) => QuesAndAns1.fromJson(x)));

String welcomeToJson(List<QuesAndAns1> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuesAndAns1 {
    QuesAndAns1({
        required this.q,
        required this.o1,
        required this.o2,
        required this.o3,
        required this.o4,
        required this.co,
    });

    String q;
    int o1;
    int o2;
    int o3;
    int o4;
    int co;

    factory QuesAndAns1.fromJson(Map<String, dynamic> json) => QuesAndAns1(
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
