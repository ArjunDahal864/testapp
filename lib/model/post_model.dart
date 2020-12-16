import 'author.dart';

class Post {
  String caption;
  String image;
  int likes;
  int shares;
  int comments;
  String slug;
  Author author;

  Post(
      {this.caption,
      this.image,
      this.likes,
      this.shares,
      this.comments,
      this.slug,
      this.author});

  Post.fromJson(Map<String, dynamic> json) {
    caption = json['caption'];
    image = json['image'];
    likes = json['likes'];
    shares = json['shares'];
    comments = json['comments'];
    slug = json['slug'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caption'] = this.caption;
    data['image'] = this.image;
    data['likes'] = this.likes;
    data['shares'] = this.shares;
    data['comments'] = this.comments;
    data['slug'] = this.slug;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    return data;
  }
}