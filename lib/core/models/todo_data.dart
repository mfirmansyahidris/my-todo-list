class TodoData {
  int? id;
  String? note;
  bool? isComplete;
  String? createdAt;
  String? completedAt;

  TodoData({
    this.id,
    this.note,
    this.isComplete = false,
    this.createdAt,
    this.completedAt
  });

  TodoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
    isComplete = json['is_complete'];
    createdAt = json['created_at'];
    completedAt = json['competed_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['note'] = note;
    data['is_complete'] = isComplete;
    data['created_at'] = createdAt;
    data['competed_at'] = completedAt;
    return data;
  }
}