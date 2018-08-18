import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();

  String _heightInFeet;
  int _heightToInch;
  String _bmi = 'Please enter fields';
  double tempbmi = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: new AppBar(
        title: new Text('BMI'),
        backgroundColor: Colors.pink,
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Center(
                  child: new Image(
                    image: AssetImage('images/bmilogo.png'),
                    width: 150.0,
                    height: 100.0,
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 50.0),
                ),
                new Container(
                  color: Colors.grey.shade500,
                  padding: EdgeInsets.all(10.0),
                  child: new Column(
                    children: <Widget>[
                      new TextField(
                        controller: _ageController,
                        keyboardType: TextInputType.numberWithOptions(),
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            icon: Icon(Icons.person), labelText: 'Age'),
                      ),
                      new TextField(
                        controller: _heightController,
                        keyboardType: TextInputType.numberWithOptions(),
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            icon: Icon(Icons.assessment),
                            labelText: 'Height In Feets'),
                      ),
                      new TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.numberWithOptions(),
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          icon: Icon(Icons.line_weight),
                          labelText: 'Weight in lb',
                          fillColor: Colors.blue,
                        ),
                      ),
                      new Padding(padding: EdgeInsets.only(top: 20.0)),
                      new MaterialButton(
                        color: Colors.pinkAccent,
                        onPressed: () => _calculateBMI(),
                        child: new Text(
                          'Calculate',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top: 20.0)),
                new Center(
                  child: new Text(
                    '$_bmi',
                    style: TextStyle(
                        color: tempbmi > 30.0 ? Colors.red : Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _calculateBMI() {
    setState(() {
      if (_ageController.text.isNotEmpty && _heightController.text.isNotEmpty &&
          _weightController.text.isNotEmpty){
//        _heightToInch = (_heightController.text.substring(_heightController.text.indexOf('.')).substring(1));
        _heightInFeet = (_heightController.text);
        List s = _heightInFeet.split(".");
        String feet = s.elementAt(0);
        String inch = s.elementAt(1);

        int feet1 = int.parse(feet);
        int inch1 = int.parse(inch);
        _heightToInch = (feet1 * 12 + inch1);
        double weight = double.parse(_weightController.text);
        _heightToInch = _heightToInch * _heightToInch;
        tempbmi = ((weight/_heightToInch) * 703);
//        _bmi = 'BMI is : '+((weight/_heightToInch) * 703).toString();
        if(tempbmi < 18.5){
          _bmi = 'BMI is : '+((weight/_heightToInch) * 703).toString() + ' (Underweight)';
        }else if(tempbmi > 18.5 && tempbmi < 24.9){
          _bmi = 'BMI is : '+((weight/_heightToInch) * 703).toString() + ' (Normal)';
        }else if(tempbmi > 25.0 && tempbmi < 29.9){
          _bmi = 'BMI is : '+((weight/_heightToInch) * 703).toString() + ' (Overweight)';
        }else if(tempbmi > 30.0){
          _bmi = 'BMI is : '+((weight/_heightToInch) * 703).toString() + ' (Obese)';
        }

        debugPrint(_bmi.toString());
      }else {
        _bmi = 'Please enter fields';
      }
    });
  }
}
