import 'package:flutter/material.dart';
import 'dart:math';

class VirtualTossScreen extends StatefulWidget {
  const VirtualTossScreen({Key? key}) : super(key: key);

  @override
  _VirtualTossScreenState createState() => _VirtualTossScreenState();
}

class _VirtualTossScreenState extends State<VirtualTossScreen> {
  int imageVariable = 1;
  String tossDetails = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFF8243),
          title: Text("Virtual Toss"),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'images/coin$imageVariable.jpg',
                height: 400.0,
              ),
              Text(
                tossDetails,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    imageVariable = Random().nextInt(2) + 1;
                    if(imageVariable == 1)
                      {
                        tossDetails = 'Heads!';
                      }
                    else
                      {
                        tossDetails = 'Tails!';
                      }
                  });
                },
                child: Image.asset('images/toss.png'),
              ),
            ],
          ),
        ));
  }
}
