class UserAccountSignUpModel {
  int? total;

  UserAccountSignUpModel({this.total});

  UserAccountSignUpModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      total = json['total'];
    }
  }

  Map<String, dynamic> toJson() => {'total': total};
}
