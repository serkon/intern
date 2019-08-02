class Person {
  String birthDate;
  String gender;
  String id;
  String name;
  bool newPerson;
  String personCode;
  String personImage;
  String startDate;
  String surname;
  String title;

  Person({
    this.birthDate,
    this.gender,
    this.id,
    this.name,
    this.newPerson,
    this.personCode,
    this.personImage,
    this.startDate,
    this.surname,
    this.title
  });

  factory Person.fromJson(Map<String, dynamic> json) => new Person(
      birthDate: json["birthDate"],
      gender: json["gender"],
      id: json["id"],
      name: json["name"],
      newPerson: json["newPerson"],
      personCode: json["personCode"],
      personImage: json["personImage"],
      startDate: json["startDate"],
      surname: json["surname"],
      title: json["title"]
  );

  Map<String, dynamic> toJson() => {
    "birthDate": birthDate,
    "gender": gender,
    "id": id,
    "name": name,
    "newPerson": newPerson,
    "personCode": personCode,
    "personImage": personImage,
    "startDate": startDate,
    "surname": surname,
    "title": title
  };
}
