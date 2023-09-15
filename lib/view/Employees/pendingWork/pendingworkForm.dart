

import 'package:flutter/material.dart';

class WorkNotCompletedForm {



_showDialog(BuildContext context , TextEditingController contro) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:  EdgeInsets.all(16.0),
          content: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller:contro ,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Enter your Comment here',
                    hintText: 'Why Not completed ',
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('OPEN'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }


}