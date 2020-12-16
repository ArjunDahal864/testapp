import 'author.dart';

class Favourite {
  String caption;
  Author author;
  String time;

  Favourite({this.caption, this.author, this.time});

  Favourite.fromJson(Map<String, dynamic> json) {
    caption = json['caption'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caption'] = this.caption;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['time'] = this.time;
    return data;
  }
}