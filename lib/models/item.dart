class Item {

  //GERADO COM JSON to Dart https://javiercbk.github.io/json_to_dart/
  String title;
  bool isDone;

  Item({this.title, this.isDone});

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    isDone = json['isDone'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['isDone'] = this.isDone;
    return data;
  }
}
