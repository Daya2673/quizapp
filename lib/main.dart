import 'package:flutter/material.dart';
import 'package:quizapp/quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main(){
  runApp(MaterialApp
    (home: quiz(),
  debugShowCheckedModeBanner: false,));
}
class quiz extends StatefulWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image:DecorationImage(image:NetworkImage('https://tse4.mm.bing.net/th?id=OIP.x9RZYWQ66XUseJxT5QB6JgHaFR&pid=Api&P=0&h=180',),
          fit: BoxFit.cover,
        ),),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body:Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        getQus(),
                        style: TextStyle(color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),),
                    ),
      SizedBox(
        height: 40,

      ),
                    // Container(height: 30,width: 500,),
                    Container(
                      color: Colors.green,
                      height: 40,
                      width: double.maxFinite,
                      child: TextButton(
                          onPressed: () {
                            check(true);
                          },
                          child: Text('TRUE', style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),)),
                    ),
                    SizedBox(height: 40,
                    width: 40,),
                    Container(
                      color: Colors.red,
                      height: 40,
                      width: double.maxFinite,
                      child: TextButton(
                          onPressed: () {
                            check(false);
                          },
                          child: Text('FAlSE', style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),)),
                    ),
                    Row(
                      children: ico,
                    ),
                  ]
          ),
    )));
  }

  List _question = [
    Quiz(qus:'Car have 4 wheels',ans:true),
    Quiz(qus: 'Bike have 3 wheels',ans: false),
    Quiz(qus: 'Sky color is blue', ans: true),
    Quiz(qus: 'Human blood color is green', ans: false),
    Quiz(qus: 'Kerala is the state of America', ans: false),
    Quiz(qus: 'India is Asian country', ans: true),
    Quiz(qus: 'Malayalam is the mother tongue of kerala', ans: true),
    Quiz(qus: 'Lionel Messi is a cricket player', ans: false),
    Quiz(qus: '125 less than 25', ans: false),
    Quiz(qus: 'Cat have 4 legs', ans: true),
  ];
      List<Icon> ico =[];
  int count = 0;
  int _qusNo = 0;

  void nextQus() {
    if (_qusNo < _question.length) {
      _qusNo++;
    }
  }

  String getQus() {
    return _question[_qusNo].qus;
  }

  bool getAns() {
    return _question[_qusNo].ans;
  }

  bool isFinished() {
    if (_qusNo >= _question.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int reset() {
    _qusNo = 0;
    count = 0;
    return _qusNo;
  }

  void check(bool answer) {
    bool value = getAns();
    setState(() {
      if (isFinished() == true) {
        //print('Finished');
        if (count <= 5) {
          Alert(context: context, title: 'THE END', desc: 'You are failed')
              .show();
          reset();
          ico = [];
        } else {
          Alert(
              context: context,
              title: 'THE END',
              desc: 'You are passed with $count marks')
              .show();
          reset();
          ico = [];
        }
      } else {
        if (value == answer) {
          print(count);
          ico.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          count++;
        } else {
          ico.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          count++;
        }
        nextQus();
      }
    });

  }
}
