// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    String name;
    String email;
    String? phone;
    String image;
    String position;
    String? code;
    String? department;

    DataModel({
        required this.name,
        required this.email,
        this.phone,
        required this.image,
        required this.position,
        this.code,
        this.department,
    });

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        position: json["position"],
        code: json["code"],
        department: json["department"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "image": image,
        "position": position,
        "code": code,
        "department": department,
    };
}
