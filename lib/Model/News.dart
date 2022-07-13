



class News {
  final String? _id;
  final String? imageURL;
  final String? title;
  final String? desc;
  final String? type;

  News(this._id, this.imageURL, this.title, this.desc, this.type);

  Map<String, dynamic> toMap() {
    return {
      '_id': _id,
      'imageURL': imageURL,
      'title': title,
      'desc': desc,
      'type': type
    };
  }
  factory News.fromJson(dynamic json) {
    return News(json['_id'] as String?, json['imageURL'] as String?,json['title'] as String?, json['desc'] as String?, json['type'] as String?);
  }

}