class SessionData {
  String name;
  String email;
  String? phone;
  String date;
  String time;

  SessionData({
    required this.date,
    required this.email,
    required this.name,
    required this.time,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'date': date,
      'time': time,
    };
  }
}
