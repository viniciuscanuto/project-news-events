class EventModel {
  String id;
  String title;
  String local;

  EventModel({this.id, this.title, this.local});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    local = json['local'];
  }
}
