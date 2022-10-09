import 'dart:convert';

class PostModel {
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? text;
  String? tags;
  String? postImages;

  PostModel({
    this.name,
    this.uId,
    this.image,
    this.dateTime,
    this.text,
    this.tags,
    this.postImages,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    dateTime = json['dateTime'];
    text = json['text'];
    tags = json['tags'];
    postImages = json['postImages'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'dateTime': dateTime,
      'text': text,
      'tags': tags,
      'postImages': postImages,
    };
  }

  PostModel? fromJson(JsonCodec json) {}
}
