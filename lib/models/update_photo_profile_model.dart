class UpdatePhotoProfileModel {
  final String? name;
  final String? type;
  final String? uri;

  UpdatePhotoProfileModel({this.name, this.type, this.uri});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'uri': uri,
    };
  }
}
