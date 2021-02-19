import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Multi app'),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTheme(
                minWidth: 288,
                height: 56,
                child: RaisedButton(
                  child: Text('Go Count App~~', style: TextStyle(fontSize: 20, color: Colors.black),),
                  color: Colors.green[500],
                  onPressed: () {
                    Navigator.pushNamed(context, '/b');
                  },
                ),
              ),
              SizedBox(height: 25),
              ButtonTheme(
                minWidth: 288,
                height: 56,
                child: RaisedButton(
                  child: Text('Go Dice App~~', style: TextStyle(fontSize: 20, color: Colors.black),),
                  color: Colors.blue[500],
                  onPressed: () {
                    Navigator.pushNamed(context, '/c');
                  },
                ),
              ),
              SizedBox(height: 25),
              ButtonTheme(
                minWidth: 288,
                height: 56,
                child: RaisedButton(
                  child: Text('Go Lotto App~~', style: TextStyle(fontSize: 20, color: Colors.black),),
                  color: Colors.orange[500],
                  onPressed: () {
                     Navigator.pushNamed(context, '/d');
                  },
                ),
              )
            ],
          ),
        ));
  }
}
