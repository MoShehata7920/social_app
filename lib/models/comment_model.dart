import 'dart:convert';

class CommentModel {
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? text;

  CommentModel({
    this.name,
    this.uId,
    this.image,
    this.dateTime,
    this.text,
    String? comment,
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    dateTime = json['dateTime'];
    text = json['text'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'dateTime': dateTime,
      'text': text,
    };
  }

  CommentModel? fromJson(JsonCodec json) {}
}
