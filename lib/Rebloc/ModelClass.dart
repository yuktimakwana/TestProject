import 'dart:convert';

ModelClass ModelFromJson(String str) => ModelClass.fromJson(json.decode(str));

String FoodFromJson(ModelClass data) => json.encode(data.toJson());

class ModelClass {
  ModelClass({
    this.records,
  });

  List<Records>? records;

  factory ModelClass.fromJson(Map<String, dynamic> json) => ModelClass(
        records:
            List<Records>.from(json["Records"].map((x) => Records.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Records": List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}

class Records {
  Records({required this.image, required this.name, required this.post});

  String image;
  String name;
  String post;

  factory Records.fromJson(Map<String, dynamic> json) => Records(
    image: json['Image'],
    name: json['Name'],
    post: json['Post']
  );

  Map<String, dynamic> toJson() => {
    "Image" :image,
    "Name" :name,
    "Post" :post
  };
}
