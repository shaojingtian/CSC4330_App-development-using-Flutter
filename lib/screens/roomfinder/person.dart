class Person {
  String name;
  String gender;
  int age;
  String zipcode;
  var budget;
  String availableDate;
  bool petOwner;
  bool smoker;

  Person(this.name, this.gender, this.age, this.zipcode, this.budget,
      this.availableDate, this.petOwner, this.smoker);

  Map<String, dynamic> toJson() => {
        'name': name,
        'gender': gender,
        'age': age,
        'zipcode': zipcode,
        'budget': budget,
        'availableDate': availableDate,
        'petOwner': petOwner,
        'smoker': smoker,
      };
}
