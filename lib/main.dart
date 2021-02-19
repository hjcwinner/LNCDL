import 'package:LNCDL/dice.dart';
import 'package:LNCDL/lotto.dart';
import 'package:flutter/material.dart';
import 'screen.dart';
import 'count.dart';
void main() => runApp(MyApp(
  
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login&Navigator&Count&Dice&Lotto',
      initialRoute: '/',
      routes: {
        '/' : (context) => Login(),
        '/a' : (context) => Screen(),
        '/b' : (context) => Countapp(),
        '/c' : (context) => Dice(),
        '/d' : (context) => Lotto(),
      },
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController log = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Center(
                    child: Image(
                      image: AssetImage('images/poket.png'),
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Form(
                      child: Theme(
                    data: ThemeData(
                        primaryColor: Colors.blue[800],
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18))),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 90, 15, 15),
                      child: Column(
                        children: [
                          TextField(
                            controller: log,
                            decoration: InputDecoration(
                                labelText: 'Enter Email address'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            controller: pass,
                            decoration:
                                InputDecoration(labelText: 'Enter Password'),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          SizedBox(height: 30),
                          ButtonTheme(
                            minWidth: 120,
                            height: 50,
                            child: RaisedButton(
                              color: Colors.blue[600],
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 35,
                              ),
                              onPressed: () {
                                if (log.text == 'multi' &&
                                    pass.text == '1234') {
                                  Navigator.pushNamed(context, '/a');
                                } else if (log.text == 'multi' &&
                                    pass.text != '1234') {
                                  lookSnackBar2(context);
                                } else if (log.text != 'multi' &&
                                    pass.text == '1234') {
                                  lookSnackBar3(context);
                                } else {
                                  lookSnackBar(context);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

void lookSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      '로그인 정보를 다시 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void lookSnackBar2(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      '비밀번호를 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void lookSnackBar3(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      '아이디를 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}
