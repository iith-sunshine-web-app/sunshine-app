class SessionData {
  String name;
  String email;
  String? phone;
  String date;
  String time;
  String counsellorsName;
  String mode;

  SessionData({
    required this.date,
    required this.email,
    required this.name,
    required this.time,
    this.phone,
    required this.counsellorsName,
    required this.mode
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'date': date,
      'time': time,
      'mode': mode,
      'counsellor': counsellorsName,
    };
  }
}
