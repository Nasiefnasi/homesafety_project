class Messages {
  String? senderId;
  String? senderEmail;
  String? receiverId;
  String? message;
  String? timestamp;
  Messages(
      {this.senderId,
      this.senderEmail,
      this.receiverId,
      this.message,
      this.timestamp});


Map<String, dynamic>toMap(){
  return{
    "senderId":senderId,
    "senderEmail":senderEmail,
    "receiverId":receiverId,
    "message":message,
    "timestamp":timestamp,



  };

}

}
