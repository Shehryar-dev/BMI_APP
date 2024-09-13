
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(bmiApp());
}

class bmiApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI APP",
      home: BMIAppPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}
class BMIAppPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BMIAppPageScreen();
  }
}

class BMIAppPageScreen extends State<BMIAppPage>{
 int hexColor(String c){
   String sColor = "0XFF" + c;
   String rColor = sColor.replaceAll('#', '');
   int dColor = int.parse(rColor.toString());
   return dColor;
 }
 var wt = TextEditingController();
 var hf = TextEditingController();
 var hI = TextEditingController();
 var message = '';
 var bgColor = Colors.indigo.shade50;
 var msg = '';

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text("BMI APP", style: TextStyle(color: Colors.white,fontSize: 22),),
        backgroundColor: Color(hexColor('035369')),
      ),

      body:Container(
        color: bgColor,
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Check BMI",style: TextStyle(fontSize: 42,color: Colors.blue[900],fontFamily: "Branch",fontWeight: FontWeight.bold),),
                Divider(color: Colors.black,height: 1,thickness: 1,),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 300,
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: wt,
                    decoration: InputDecoration(
                      label: Text("Enter Your Weight(in Kgs)",style: TextStyle(fontSize: 16,color: Colors.blue[900]),),
                      prefixIcon: Icon(Icons.line_weight,color: Colors.blue[900],size: 22,)
                    ),
                  ),
                ),Container(
                  margin: EdgeInsets.only(top: 3),
                  width: 300,
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: hf,
                    decoration: InputDecoration(
                        label: Text("Enter Your Height(in Feet)",style: TextStyle(fontSize: 16,color: Colors.blue[900]),),
                        prefixIcon: Icon(Icons.height,color: Colors.blue[900],size: 22,)
                    ),
                  ),
                ),Container(
                  margin: EdgeInsets.only(top: 3),
                  width: 300,
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: hI,
                    decoration: InputDecoration(
                        label: Text("Enter Your Height(in Inch)",style: TextStyle(fontSize: 16,color: Colors.blue[900]),),
                        prefixIcon: Icon(Icons.height,color: Colors.blue[900],size: 22,)
                    ),
                  ),
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                  var weight = wt.text.toString();
                  var height_feet = hf.text.toString();
                  var height_inch = hI.text.toString();

                  if(weight != '' && height_feet != '' && height_inch != ''){
                    var wt = int.parse(weight);
                    var hf = int.parse(height_feet);
                    var hi = int.parse(height_inch);

                    var tInch = (hf*12) + hi;
                    var tCm = tInch * 2.54;
                    var tm = tCm/100;

                    var bmi = wt/(tm*tm);
                    if(bmi>25){
                      msg = "You're OverWeight!!";
                      bgColor = Colors.orange.shade200;
                    }else if(bmi<18){
                      msg = "You're UnderWeight!!";
                      bgColor = Colors.red.shade200;
                    }else{
                      msg = "You're Healthy!!";
                      bgColor = Colors.green.shade200;
                    }
                      message = "Your BMI is: ${bmi.toStringAsFixed(2)}";

                  }else{
                    message = "Plz Enter a value";
                  }
                  });

                }, child: Text("Calculate",style: TextStyle(color: Colors.blue[900]),),),
                SizedBox(height: 10,),
                Text('$message',style: TextStyle(fontSize: 18),),
                SizedBox(height: 10,),
                Text('$msg',style: TextStyle(fontSize: 18),),




              ],
            ),
          ),
        ),
      ),

    );
  }
}