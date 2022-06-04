import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
  const Popup({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Timer finished!"),
      content: Text(
        "Your one minute timer is up! If you want to reset your timer, hit the reset button"
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context); 
        }, child: Text("OK"),)
      ],
    );
  }
}