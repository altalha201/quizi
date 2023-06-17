class TeacherProfileModel {
  String? uid;
  String? role;
  String? userName;
  String? email;
  String? imgUrl;
  int? noOfQuizzes;
  int? participants;

  TeacherProfileModel(
      {this.uid,
      this.role,
      this.userName,
      this.email,
      this.imgUrl,
      this.noOfQuizzes,
      this.participants});

  TeacherProfileModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    role = json['role'];
    userName = json['user_name'];
    email = json['email'];
    imgUrl = json['img_url'];
    noOfQuizzes = json['no_of_quizzes'];
    participants = json['participants'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['role'] = role;
    data['user_name'] = userName;
    data['email'] = email;
    data['img_url'] = imgUrl;
    data['no_of_quizzes'] = noOfQuizzes;
    data['participants'] = participants;
    return data;
  }
}
