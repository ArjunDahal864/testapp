import 'author.dart';

class Noti {
  String msg;
  Author author;
  String time;

  Noti({this.msg, this.author, this.time});

  Noti.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['time'] = this.time;
    return data;
  }
}