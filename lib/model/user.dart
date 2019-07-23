class User {
  // TODO: mock class for now

  String accessToken;
  String email;
  String employeeId;

  String userId;
  String userName;
  String userSurname;

  User({
    this.accessToken,
    this.email,
    this.employeeId,
    this.userId,
    this.userName,
    this.userSurname,
  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
    accessToken: json["access_token"],
    email: json["email"],
    employeeId: json["employeeId"],
    userId: json["userId"],
    userName: json["userName"],
    userSurname: json["userSurname"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "email": email,
    "employeeId": employeeId,
    "userId": userId,
    "userName": userName,
    "userName": userName,
    "userSurname": userSurname,
  };
}