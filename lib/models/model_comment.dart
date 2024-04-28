class Comment {
  final int userId;
  final int boardId;
  final String body;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Comment({
    required this.userId,
    required this.boardId,
    required this.body,
    this.createdAt,
    this.updatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      userId: json['userId'] as int,
      boardId: json['boardId'] as int,
      body: json['body'] as String,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'boardId': boardId,
    'body': body,
    if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
    if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
  };
}
