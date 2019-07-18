class User {
  // TODO: mock class for now

  int id;
  String name;
  String username;
  String email;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
  };
}