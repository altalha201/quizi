class NormalQuizModel {
  String? quizId;
  String? creatorId;
  String? creatorName;
  String? quizTitle;
  int? totalQuestions;
  String? quizTheme;

  NormalQuizModel(
      {this.quizId,
        this.creatorId,
        this.creatorName,
        this.quizTitle,
        this.totalQuestions,
        this.quizTheme});

  NormalQuizModel.fromJson(Map<String, dynamic> json) {
    quizId = json['quiz_id'];
    creatorId = json['creator_id'];
    creatorName = json['creator_name'];
    quizTitle = json['quiz_title'];
    totalQuestions = json['total_questions'];
    quizTheme = json['quiz_theme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quiz_id'] = quizId;
    data['creator_id'] = creatorId;
    data['creator_name'] = creatorName;
    data['quiz_title'] = quizTitle;
    data['total_questions'] = totalQuestions;
    data['quiz_theme'] = quizTheme;
    return data;
  }
}
