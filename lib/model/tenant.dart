class Tenant {
  bool active;
  String description;
  String extraData;
  List<String> icon;
  String tenantId;
  String name;
  String url;

  Tenant({
    this.active,
    this.description,
    this.extraData,
    this.icon,
    this.tenantId,
    this.name,
    this.url
  });

  factory Tenant.fromJson(Map<String, dynamic> json) => new Tenant(
    active: json["active"],
    description: json["description"],
    extraData: json["extraData"],
    icon: new List<String>.from(json["icon"]),
    tenantId: json["tenantId"],
    name: json["name"],
    url: json["url"]
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "description": description,
    "extraData": extraData,
    "icon": icon,
    "tenantId": tenantId,
    "name": name,
    "url": url
  };
}
