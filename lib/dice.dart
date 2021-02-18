import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int dice1 = 1;
  int dice2 = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[500],
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('images/$dice1.PNG')),
                Image(image: AssetImage('images/$dice2.PNG'))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ButtonTheme(
              minWidth: 88,
              height: 60,
              child: RaisedButton(
                child: Icon(
                  Icons.arrow_forward,
                  size: 35,
                  color: Colors.white,
                ),
                color: Colors.blueAccent,
                onPressed: () {
                  setState(() {
                    dice1 = Random().nextInt(6) + 1;
                    dice2 = Random().nextInt(6) + 1;
                  });
                  lookToast("첫번째 주사위 값은 $dice1,    두번쨰 주사위 값은 $dice2");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

void lookToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
