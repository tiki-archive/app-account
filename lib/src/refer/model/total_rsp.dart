class ReferModelTotalRsp {
  int? total;

  ReferModelTotalRsp({this.total});

  ReferModelTotalRsp.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      total = json['total'];
    }
  }

  Map<String, dynamic> toJson() => {'total': total};
}
