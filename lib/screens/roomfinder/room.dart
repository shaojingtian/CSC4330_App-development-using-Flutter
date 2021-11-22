class Room {
  String roomType;
  String zipcode;
  String address;
  var rent;
  String availableDate;
  String preferredGender;

  Room(this.roomType, this.zipcode, this.address, this.rent, this.availableDate,
      this.preferredGender);

  Map<String, dynamic> toJson() => {
        'roomType': roomType,
        'zipcode': zipcode,
        'address': address,
        'rent': rent,
        'availableDate': availableDate,
        'preferredGender': preferredGender,
      };
}
