class LiveQuizModel {
  String? quizId;
  String? creatorId;
  String? creatorName;
  String? quizTitle;
  int? totalQuestions;
  String? quizTheme;
  String? startDate;
  String? endDate;

  LiveQuizModel(
      {this.quizId,
        this.creatorId,
        this.creatorName,
        this.quizTitle,
        this.totalQuestions,
        this.quizTheme,
        this.startDate,
        this.endDate});

  LiveQuizModel.fromJson(Map<String, dynamic> json) {
    quizId = json['quiz_id'];
    creatorId = json['creator_id'];
    creatorName = json['creator_name'];
    quizTitle = json['quiz_title'];
    totalQuestions = json['total_questions'];
    quizTheme = json['quiz_theme'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quiz_id'] = quizId;
    data['creator_id'] = creatorId;
    data['creator_name'] = creatorName;
    data['quiz_title'] = quizTitle;
    data['total_questions'] = totalQuestions;
    data['quiz_theme'] = quizTheme;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }
}
