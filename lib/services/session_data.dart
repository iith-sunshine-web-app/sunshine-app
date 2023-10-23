class SessionData {
  String name;
  String email;
  String? phone;
  String date;
  String time;
  String counsellorsName;
  String counsellorsEmail;
  String counsellorsPhone;
  bool isSir;
  String mode;

  SessionData({
    required this.date,
    required this.email,
    required this.name,
    required this.time,
    this.phone,
    required this.counsellorsName,
    required this.mode,
    this.isSir = false,
    required this.counsellorsEmail,
    required this.counsellorsPhone

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
