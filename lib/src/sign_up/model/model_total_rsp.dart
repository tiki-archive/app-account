class SignUpModelTotalRsp {
  int? total;

  SignUpModelTotalRsp({this.total});

  SignUpModelTotalRsp.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      total = json['total'];
    }
  }

  Map<String, dynamic> toJson() => {'total': total};
}
