class GoogleResponseModel {
  String? googleLoginUrl;

  GoogleResponseModel({this.googleLoginUrl});

  GoogleResponseModel.fromJson(Map<String, dynamic> json) {
    googleLoginUrl = json['google_login_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['google_login_url'] = googleLoginUrl;
    return data;
  }
}
