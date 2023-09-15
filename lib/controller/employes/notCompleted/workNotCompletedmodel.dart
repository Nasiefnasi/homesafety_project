class NotCompleted {
  String? comment;
  String? emploid;
  String? userId;
  String? username;
  String? employename;
  String? usernameurl;
  String? employenameurl;

  NotCompleted({
    this.comment,
    this.emploid,
    this.userId,
    this.username,
    this.employename,
    this.usernameurl,
    this.employenameurl,
  });

  factory NotCompleted.fromJson(Map<String, dynamic> json) {
    return NotCompleted(
      comment: json['comment'] as String?,
      emploid: json['emploid'] as String?,
      userId: json['userId'] as String?,
      username: json['username'] as String?,
      employename: json['employename'] as String?,
      usernameurl: json['userimageurl'] as String?,
      employenameurl: json['employenameurl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'emploid': emploid,
      'userId': userId,
      'username': username,
      'employename': employename,
      'usernameurl': usernameurl,
      'employenameurl': employenameurl,
    };
  }
}
