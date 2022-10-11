import 'dart:convert';

class CommentModel {
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? comment;

  CommentModel({this.name, this.uId, this.image, this.dateTime, this.comment});

  CommentModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    dateTime = json['dateTime'];
    comment = json['comment'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'dateTime': dateTime,
      'comment': comment,
    };
  }

  // ignore: body_might_complete_normally_nullable
  CommentModel? fromJson(JsonCodec json) {}
}
