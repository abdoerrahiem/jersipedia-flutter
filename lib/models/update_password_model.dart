class UpdatePasswordModel {
  final String? oldPassword;
  final String? newPassword;

  UpdatePasswordModel({this.oldPassword, this.newPassword});

  Map<String, dynamic> toJson() {
    return {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };
  }
}
