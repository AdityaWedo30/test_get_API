class UserApi {
  final int id;
  final String name;
  final String email;
  final String city;

  UserApi({required this.id, required this.name, required this.email, required this.city});

  factory UserApi.fromJson(Map<String, dynamic> json) {
    return UserApi(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      city: json['address']['city'],
    );
  }
}