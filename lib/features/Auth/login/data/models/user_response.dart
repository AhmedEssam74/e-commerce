class UserResponse {
  String? refresh;
  String? access;
  User? user;

  UserResponse({this.refresh, this.access, this.user});

  UserResponse.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  Null? profileImg;
  double? balance;
  String? streetName;
  String? houseNum;
  String? city;
  String? zipCode;
  String? createdAt;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.profileImg,
      this.balance,
      this.streetName,
      this.houseNum,
      this.city,
      this.zipCode,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    profileImg = json['profile_img'];
    balance = json['balance'];
    streetName = json['street_name'];
    houseNum = json['house_num'];
    city = json['city'];
    zipCode = json['zip_code'];
    createdAt = json['created_at'];
  }
}
