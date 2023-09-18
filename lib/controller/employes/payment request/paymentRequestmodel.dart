// ignore_for_file: file_names

class PaymentRequestModel {
  String? userid;
  String? username;
  String? userImageUrl;
  String? employid;
  String? employName;
  String? employImageUrl;
  String? work;
  String? description;
  String?
      payment; // Assuming payment is a numeric value, change the type accordingly

  PaymentRequestModel({
    this.userid,
    this.username,
    this.userImageUrl,
    this.employid,
    this.employName,
    this.employImageUrl,
    this.work,
    this.description,
    this.payment,
  });

  factory PaymentRequestModel.fromMap(Map<String, dynamic> map) {
    return PaymentRequestModel(
      userid: map['userid'],
      username: map['username'],
      userImageUrl: map['userImageUrl'],
      employid: map['employid'],
      employName: map['employName'],
      employImageUrl: map['employImageUrl'],
      work: map['work'],
      description: map['description'],
      payment: map['payment']?.toDouble(), // Convert to double if it's numeric
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'username': username,
      'userImageUrl': userImageUrl,
      'employid': employid,
      'employName': employName,
      'employImageUrl': employImageUrl,
      'work': work,
      'description': description,
      'payment': payment,
    };
  }

  // Optionally, you can add other methods or validations here.
}
