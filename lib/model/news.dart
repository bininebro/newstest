class News {
  String? headline;
  String? imageSource;
  String? imageName;
  String? description;
  String? source;
  bool isExpanded = false;
  News(
      {this.headline,
      this.imageSource,
      this.imageName,
      this.description,
      this.source});

  News.fromJson(Map<String, dynamic> json) {
    headline = json['headline'];
    imageSource = json['image_source'];
    imageName = json['image_name'];
    description = json['description'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['headline'] = this.headline;
    data['image_source'] = this.imageSource;
    data['image_name'] = this.imageName;
    data['description'] = this.description;
    data['source'] = this.source;
    return data;
  }
}
