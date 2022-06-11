class User {
  final int id;
  final String email;
  final String password;
  final String number;

  User({this.id, this.email, this.password, this.number});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'],
      password: json['pasword'],
      number: json['number'],
    );
  }
}
