class ToDosModel {
  String? todo;
  bool? completed;

  ToDosModel({this.todo, this.completed});

  ToDosModel.fromJson(Map<String, dynamic> json) {
    todo = json['task'];
    completed = json['isComplete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task'] = this.todo;
    data['isComplete'] = this.completed;
    return data;
  }
}
