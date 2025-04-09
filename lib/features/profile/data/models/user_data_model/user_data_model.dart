class UserDataResponse {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  Null? profileImg;
  String? balance;
  String? streetName;
  String? houseNum;
  String? city;
  String? zipCode;
  bool? verified;
  bool? isStaff;
  bool? isSuperuser;

  UserDataResponse(
      {this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.profileImg,
        this.balance,
        this.streetName,
        this.houseNum,
        this.city,
        this.zipCode,
        this.verified,
        this.isStaff,
        this.isSuperuser});

  UserDataResponse.fromJson(Map<String, dynamic> json) {
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
    verified = json['verified'];
    isStaff = json['is_staff'];
    isSuperuser = json['is_superuser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['profile_img'] = profileImg;
    data['balance'] = balance;
    data['street_name'] = streetName;
    data['house_num'] = houseNum;
    data['city'] = city;
    data['zip_code'] = zipCode;
    data['verified'] = verified;
    data['is_staff'] = isStaff;
    data['is_superuser'] = isSuperuser;
    return data;
  }
}