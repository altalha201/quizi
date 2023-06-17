class StudentProfileModel {
  String? uid;
  String? role;
  String? userName;
  String? email;
  String? imgUrl;
  int? totalPoints;
  int? points;

  StudentProfileModel(
      {this.uid,
        this.role,
        this.userName,
        this.email,
        this.imgUrl,
        this.totalPoints,
        this.points});

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    role = json['role'];
    userName = json['user_name'];
    email = json['email'];
    imgUrl = json['img_url'];
    totalPoints = json['total_points'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['role'] = role;
    data['user_name'] = userName;
    data['email'] = email;
    data['img_url'] = imgUrl;
    data['total_points'] = totalPoints;
    data['points'] = points;
    return data;
  }
}
