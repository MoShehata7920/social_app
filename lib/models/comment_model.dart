import 'dart:convert';

class PostModel {
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? comment;

  PostModel({
    this.name,
    this.uId,
    this.image,
    this.dateTime,
    this.comment,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
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

  PostModel? fromJson(JsonCodec json) {}
}
