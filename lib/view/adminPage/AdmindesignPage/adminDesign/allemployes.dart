import 'package:flutter/material.dart';
import 'package:homesefty/core/size/colors&size.dart';


class Employeslist extends StatelessWidget {
  const Employeslist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body:  ListView.builder( itemCount: 10,
        itemBuilder: (context, index) {
        return
    
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: 70,
            // color: Colors.amber,
            child: Card(
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                shadowColor: Colors.teal,
                elevation: 5,
                color: const Color.fromARGB(255, 233, 230, 230),
                child: const Row(
                  children: [
                    Width10,
                    CircleAvatar(
                      radius: 25,
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Width10,
                    SizedBox(
                      // color: Colors.amber,
                      width: 150,
                      child: Text(
                        'User Name',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      // color: Colors.amber,
                      width: 100,
                      child: Text(
                        'Work',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 4, 112, 40)),
                      ),
                    ),
                    SizedBox(
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