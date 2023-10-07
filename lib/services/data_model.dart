class DataModel {
  String name;
  String email;
  String phone;
  String image;
  String position;

  DataModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.position,
  });

  // Define a toMap method to convert the object to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'position': position,
    };
  }

  // Define a factory constructor to create a DataModel object from a Map
  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      image: map['image'],
      position: map['position'],
    );
  }
}
