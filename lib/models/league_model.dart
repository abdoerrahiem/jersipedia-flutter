class LeagueModel {
  final String? id;
  final String? title;
  final String? image;

  LeagueModel({
    this.id,
    this.title,
    this.image,
  });

  factory LeagueModel.fromJson(Map<String, dynamic> json) => LeagueModel(
        id: json['_id'],
        title: json['title'],
        image: json['image'],
      );
}
