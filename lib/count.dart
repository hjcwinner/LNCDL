import 'package:flutter/material.dart';

class Countapp extends StatefulWidget {
  @override
  _CountappState createState() => _CountappState();
}

class _CountappState extends State<Countapp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count App'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green[500],
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '버튼을 눌러서 증가와 감소를 해보세요',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '$counter',
                style: TextStyle(fontSize: 45, color: Colors.red),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          counter++;
                          countSnackBar2(context, counter);
                        });
                      },
                      heroTag: "btn1"),
                  SizedBox(width: 15),
                  FloatingActionButton(
                      heroTag: "btn2",
                      child: Icon(Icons.remove),
                      onPressed: () {
                        setState(
                          () {
                            if (counter < 1) {
                              countSnackBar(context);
                            } else {
                              counter--;
                              countSnackBar2(context, counter);
                            }
                          },
                        );
                      })
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}

void countSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      '음수는 허용하지 않습니다',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 1),
    backgroundColor: Colors.green[500],
  ));
}

void countSnackBar2(BuildContext context, counter) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        '현재 숫자는 $counter 입니다',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 1),
    backgroundColor: Colors.green[500],
  ));
}
