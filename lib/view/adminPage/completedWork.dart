import 'package:flutter/material.dart';
import 'package:homesefty/core/size/colors&size.dart';

class CompletedWork extends StatelessWidget {
  const CompletedWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body:  ListView.builder( itemCount: 10,
        itemBuilder: (context, index) {
        return
    
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 70,
            // color: Colors.amber,
            child: Card(
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                shadowColor: Colors.teal,
                elevation: 5,
                color: const Color.fromARGB(255, 233, 230, 230),
                child: Row(
                  children: [
                    Width10,
                    const CircleAvatar(
                      radius: 25,
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Width10,
                    Container(
                      // color: Colors.amber,
                      width: 150,
                      child: const Text(
                        'User Name',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      // color: Colors.amber,
                      width: 100,
                      child: const Text(
                        'completed work',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                )),
          ),
          
        );
   } ),
    );
  }
}