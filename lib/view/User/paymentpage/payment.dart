import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RozzerPayResponse {
  String? amun;
  String? empid;
  String? userName;
  String?userimag;

  User? user = FirebaseAuth.instance.currentUser;

  Razorpay razorpay = Razorpay();

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: 'Success Payment: ${response.paymentId}',
      backgroundColor: Colors.green,
      timeInSecForIosWeb: 4,
    );

    if (user != null) {
      FirebaseFirestore.instance
          .collection('AfterpaymentUserDetails')
          .doc(user?.uid)
          .set({
        'userid': user!.uid,
        "userName": userName,
        'amount_perice': amun,
        'emoployid': empid,
        'amount ': response.paymentId,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: 'Error ${response.code}- ${response.message}',
      timeInSecForIosWeb: 4,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: 'Wallet ${response.walletName}',
      timeInSecForIosWeb: 4,
    );
  }

  makePayment(String amount, String employName, String emploid,String username,String userimages) async {
    userName = username.toString();
    amun = amount;
    empid = emploid;
    userimag = userimages;
    int? price = int.tryParse(amount);
    int? onamound = price! * 100;

    var options = {
      'key': 'rzp_test_5GZdL4kxKRGHek',
      "userImageUrl":userimag,
      'amount': onamound,
      'name': 'Home safety',
      'description': employName,
      'prefill': {
        'contact': '+917561000296',
        'email': 'contact@protocoderpoint.cpm',
      },
    };

    try {
      razorpay.open(options);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);

      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
