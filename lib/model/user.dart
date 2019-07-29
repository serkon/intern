import 'package:flutter_login/model/tenant.dart';

class User {
  String accessToken;
  String email;
  String employeeId;
  String userId;
  String userName;
  String userSurname;
  List<Tenant> tenantList;

  User({
    this.accessToken,
    this.email,
    this.employeeId,
    this.userId,
    this.userName,
    this.userSurname,
    this.tenantList
  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
      accessToken: json["access_token"],
      email: json["email"],
      employeeId: json["employeeId"],
      userId: json["userId"],
      userName: json["userName"],
      userSurname: json["userSurname"],
      tenantList: handleTenants(json["tenantList"])
  );

  Map<String, dynamic> toJson() => {
      "access_token": accessToken,
      "email": email,
      "employeeId": employeeId,
      "userId": userId,
      "userName": userName,
      "userSurname": userSurname,
      "tenantList": tenantList,
  };

  static List<Tenant> handleTenants(List<dynamic> tenants) {
    List<Tenant> tenantList = new List();
    tenants.forEach((tenant) {
      tenantList.add(Tenant.fromJson(tenant));
    });
    return tenantList;
  }
}
