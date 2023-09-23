import 'package:flutter/material.dart';


class Adminwallet extends StatelessWidget {
  const Adminwallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wallet"),),
      body: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                // color: Colors.orange,
                child: Image.asset('asset/animation/6081546-01-01.png'),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("paymet status",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              // Expanded(
              //   child: ListView.builder( itemCount: 10, itemBuilder: (context, index) {
              //     return SuccessfulPaymentListModel(indexss: index*19,);
              //   },),
              // )
            ],
          )),
    );
  }
}
