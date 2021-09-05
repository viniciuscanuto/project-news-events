class NewsModel {
  String id;
  String title;
  String author;
  String content;
  //DateTime createdAt;

  NewsModel(
      {this.id, this.title, this.author, this.content /*, this.createdAt*/});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    content = json['content'];
    //createdAt = json['createdAt'];
  }
}
