import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Lotto extends StatefulWidget {
  @override
  _LottoState createState() => _LottoState();
}

class _LottoState extends State<Lotto> {
  TextEditingController lottoCheck = TextEditingController();

  int plus;
  List<int> result = [];
  List<int> recomresult = [];
  List<int> sul = [1, 2, 3, 4, 5, 6];
  List<int> recomsul = [1, 2, 3, 4, 5, 6];

  Future<List> fetchData() async {
    final http.Response response = await http.get(
        'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=${lottoCheck.text}');

    List<int> num1 = [];

    if (response.statusCode == 200) {
      String jsonData = response.body;
      for (int i = 0; i < 6; i++) {
        plus = jsonDecode(jsonData)['drwtNo${i + 1}'];
        num1.add(plus);
      }
    }
    return num1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lotto'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.orange[500],
        ),
        body: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 140, 30, 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '로또당첨번호 확인하기',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 2),
                          height: 30,
                          width: 60,
                          child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              controller: lottoCheck,
                              keyboardType: TextInputType.number),
                        ),
                        Text(
                          '회차',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    ButtonTheme(
                      child: RaisedButton(
                        color: Colors.orange[900],
                        child: Text(
                          '검색',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: () async {
                          result = await fetchData();
                          setState(() {
                            sul = result;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('images/ball_${sul[0]}.png'),
                          height: 45,
                          width: 45,
                        ),
                        Image(
                          image: AssetImage('images/ball_${sul[1]}.png'),
                          height: 45,
                          width: 45,
                        ),
                        Image(
                          image: AssetImage('images/ball_${sul[2]}.png'),
                          height: 45,
                          width: 45,
                        ),
                        Image(
                          image: AssetImage('images/ball_${sul[3]}.png'),
                          height: 45,
                          width: 45,
                        ),
                        Image(
                          image: AssetImage('images/ball_${sul[4]}.png'),
                          height: 45,
                          width: 45,
                        ),
                        Image(
                          image: AssetImage('images/ball_${sul[5]}.png'),
                          height: 45,
                          width: 45,
                        )
                      ],
                    ),
                    SizedBox(height: 30,),
                    Text(
                      '추첨 번호 생성하기',
                      style: TextStyle(fontSize: 20),
                    ),
                    ButtonTheme(
                      child: RaisedButton(
                        color: Colors.orange[900],
                        child: Text(
                          '생성',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          recomresult = recommendnum();
                          setState(() {
                            recomsul = recomresult;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('images/ball_${recomsul[0]}.png'),
                          height: 45,
                          width: 45,
                        ),
                        Image(
                          image: AssetImage('images/ball_${recomsul[1]}.png'),
                          height: 45,
                          width: 45,
                        ),
                        Image(
                          image: AssetImage('images/ball_${recomsul[2]}.png'),
                          height: 45,
                          width: 45,
                        ),
                        Image(
                          image: AssetImage('images/ball_${recomsul[3]}.png'),
                          height: 45,
                          width: 45,
                        ),
                        Image(
                          image: AssetImage('images/ball_${recomsul[4]}.png'),
                          height: 45,
                          width: 45,
                        ),
                        Image(
                          image: AssetImage('images/ball_${recomsul[5]}.png'),
                          height: 45,
                          width: 45,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}

List<int> recommendnum(){

  var number = (List.generate(45, (i) => ++i)..shuffle()).sublist(0,6);
  return number;

}