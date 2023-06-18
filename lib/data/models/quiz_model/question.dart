class Question {
  String? ques;
  String? op1;
  String? op2;
  String? op3;
  String? op4;
  String? ans;

  Question(
      {this.ques, this.op1, this.op2, this.op3, this.op4, this.ans});

  Question.fromJson(Map<String, dynamic> json) {
    ques = json['question'];
    op1 = json['op_1'];
    op2 = json['op_2'];
    op3 = json['op_3'];
    op4 = json['op_4'];
    ans = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = ques;
    data['op_1'] = op1;
    data['op_2'] = op2;
    data['op_3'] = op3;
    data['op_4'] = op4;
    data['answer'] = ans;
    return data;
  }
}