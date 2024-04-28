class Board {
  int? id;
  final int userId;
  final String body;
  final String category;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int likeCnt;
  final int commentCnt;
  final int? uploadImageId;

  Board({
    this.id,
    required this.userId,
    required this.body,
    required this.category,
    this.createdAt,
    this.updatedAt,
    required this.likeCnt,
    required this.commentCnt,
    required this.uploadImageId,
  });

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      id: json['id'],
      userId: json['userId'] as int,
      body: json['body'] as String,
      category: json['category'] as String,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      likeCnt: json['likeCnt'] as int,
      commentCnt: json['commentCnt'] as int,
      uploadImageId: json['uploadImageId'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'body': body,
    'category': category,
    if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
    if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
    'likeCnt': likeCnt,
    'commentCnt': commentCnt,
    'uploadImageId': uploadImageId,
  };
}


