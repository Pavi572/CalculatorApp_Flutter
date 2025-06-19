import 'package:flutter/material.dart';
void main(){
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String inputValue = "";
  String calculatedvalue="";
  String operator="";
  double size=0;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5;
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                margin:EdgeInsets.only(top:145,bottom: 20),
                child: Text(inputValue,
                  style: TextStyle(color: Colors.white, fontSize: 80),),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      calcButton("7", Colors.white38),
                      calcButton("8", Colors.white38),
                      calcButton("9", Colors.white38),
                      calcButton("/", Colors.blue),
                    ],
                  ),
                  Row(
                    children: [
                      calcButton("4", Colors.white38),
                      calcButton("5", Colors.white38),
                      calcButton("6", Colors.white38),
                      calcButton("*", Colors.blue),
                    ],
                  ),
                  Row(
                    children: [
                      calcButton("1", Colors.white38),
                      calcButton("2", Colors.white38),
                      calcButton("3", Colors.white38),
                      calcButton("-", Colors.blue),
                    ],
                  ),
                  Row(
                    children: [
                      calcButton("0", Colors.white38),
                      calcButton(".", Colors.white38),
                      calcButton("=", Colors.blue),
                      calcButton("+", Colors.blue),
                    ],
                  ),
                ],
              ),
              calcButton("Clear", Colors.black),
            ],
          )
      ),
    );
  }

    Widget calcButton(String text, Color bgclr) {
      return InkWell(
        onTap: () {
          if(text=="Clear"){
            setState(() {
              inputValue="";
              calculatedvalue="";
              operator="";
            });
          }
          else if(text=='+'||text=='-'||text=='*'||text=='/'){
            setState((){
              calculatedvalue=inputValue;
              inputValue="";
              operator=text;
            }
            );
          }
          else if(text=='='){
            setState(() {
              double calc=double.parse(calculatedvalue);
              double input=double.parse(inputValue);
              if(operator=='+'){
                inputValue=(calc+input).toString();
              }
              else if(operator=='-'){
                inputValue=(calc-input).toString();
              }
              else if(operator=='*'){
                inputValue=(calc*input).toString();
              }
              else if(operator=='/'){
                inputValue=(calc/input).toString();
              }
            });
          }
          else{
            setState(() {
              inputValue = inputValue+text;
            });
          }
          },

        child: Container(
          height: size,
          decoration: BoxDecoration(
            color: bgclr, borderRadius: BorderRadius.circular(99),),
          width: size,
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          child: Text(
              text, style: TextStyle(color: Colors.white, fontSize: 35,)),
        ),
      );
    }
  }
