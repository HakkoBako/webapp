import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SignUpScreen(),
      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _finalweight = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
  bool grams = true;
  bool pans = false;
  bool cup = false;
  bool bowl = false;
  bool jar = true;
  double _formProgress = 0;
  String selectitem = 'select item';
  int containerwt = 0;
  double saltpercent = 0;

  Widget getchildbutton(){
    if (jar){
      return Row(
        children: [
          ElevatedButton(child: Image.asset('assets/gallonjar.png', scale: 1.93, fit: BoxFit.fill,),
          onPressed: (){
            setState(() {
              selectitem = "Gallon Jar";
              containerwt = 180;
            });
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed))
          return Colors.orange;
          return Colors.white; // Use the component's default.
          },)),),
          ElevatedButton(child: Image.asset('assets/masonjar.png', scale: 1.93, fit: BoxFit.fill,),
            onPressed: (){
              setState(() {
                selectitem = "Mason Jar";
                containerwt = 170;
              });
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return Colors.orange;
              return Colors.white; // Use the component's default.
            },)),),

        ],
      );
    }
    else if(bowl){
      return Row(
          children: [
            ElevatedButton(child: Image.asset('assets/glassbowl.png', scale: 1.93, fit: BoxFit.fill,), onPressed: (){
              setState(() {
                selectitem = "Glass Bowl";
              });
            },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                  return Colors.orange;
                  return Colors.white; // Use the component's default.
                  },)),),
          ],
      );
    }
    else {
      return (Container(child: Text('testing'),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: _formProgress),
          Text('Tare Tool', style: Theme
              .of(context)
              .textTheme
              .headline4),
          SizedBox(height: 5,),
          Text('TOTAL WEIGHT', style: Theme.of(context).textTheme.headline6,),
          Row( mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(child: Text('What is your' + '\n'+'scale showing ?',),),
            Container(child: TextFormField(controller: _finalweight, decoration: InputDecoration(hintText: '789',), textAlign: TextAlign.center,), width: 50,),
            GestureDetector(child: Container(child: Text('grams', style: TextStyle(color:grams ? Colors.white : Colors.black, fontWeight: FontWeight.bold),),
                padding: EdgeInsets.all(5), decoration: BoxDecoration(color:grams ? Colors.orange : Colors.white,border: Border.all(
                color:grams ? Colors.orange : Colors.white, width: 2))), onTap: () {setState(() {
              grams = true;
                });},),
            GestureDetector(child: Container(child: Text('lbs', style: TextStyle(color:grams ? Colors.black : Colors.white, fontWeight: FontWeight.bold),), padding: EdgeInsets.all(5), decoration: BoxDecoration(color:grams ? Colors.white : Colors.orange,border: Border.all(
                color:grams ? Colors.white : Colors.orange, width: 2))), onTap: () {setState(() {
              grams = false;
                });},),
          ],),
          Text('Select your type of jar'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  ElevatedButton(child:Text('Pans', style: TextStyle(color:pans? Colors.orange : Colors.black,),), onPressed: () {
                    setState(() {
                      cup = false;
                      pans = true;
                      jar = false;
                      bowl = false;
                    });
                  }, style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.orange;
                    return Colors.white; // Use the component's default.
                  },)),),
                  ElevatedButton(child: Container(child: Text('Cups', style: TextStyle(color:cup? Colors.orange : Colors.black,),),
                  ), style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.orange;
                    return Colors.white; // Use the component's default.
                  },)), onPressed: () {
                    setState(() {
                      cup = true;
                      pans = false;
                      jar = false;
                      bowl = false;
                    });
                  },),
                  ElevatedButton(child: Container(child: Text('Bowls', style: TextStyle(color:bowl? Colors.orange : Colors.black,)),
                  ), style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.orange;
                    return Colors.white; // Use the component's default.
                  },)), onPressed: () {
                    setState(() {
                      bowl = true;
                      pans = false;
                      jar = false;
                      cup = false;
                    });
                  },),

                  ElevatedButton(child: Container(child: Text('Jars', style: TextStyle(color:jar? Colors.orange : Colors.black,)),),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.orange;
                      return Colors.white; // Use the component's default.
                    },)), onPressed: () {
                      setState(() {
                        bowl = false;
                        pans = false;
                        jar = true;
                        cup = false;
                      });
                    },),
                ],)),
                SizedBox(width: 1),
                getchildbutton(),
              ],),
            ],
          ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selected container: '),
            Container(child: RichText(text: TextSpan(text: '$selectitem', style: TextStyle(color: Colors.black)),),
                decoration: BoxDecoration(border: Border.all(color: Colors.orange, width: 1)), padding: EdgeInsets.all(1),),
            Text(' Estimated weight'),
            SizedBox(width: 1,),
            Container(child: RichText(text: TextSpan(text: containerwt.toString(), style: TextStyle(color: Colors.black)),),
              decoration: BoxDecoration(border: Border.all(color: Colors.orange, width: 1)), padding: EdgeInsets.all(1),),
            SizedBox(width: 1,),
            Text(grams ? 'gms' : 'lbs'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Salt to be added'),
            Slider(value: saltpercent, min: 0, max: 20, divisions: 80, activeColor: Colors.orange, inactiveColor: Colors.grey,
                label: saltpercent.toString() + '%', onChanged: (double value) {
              setState(() {
                saltpercent = value;
              });
            }),
            Text('Percent'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Salt weight'),
            SizedBox(width: 3,),
            Container(child: RichText(text: TextSpan(text: (saltpercent*789/100).toString(), style: TextStyle(color: Colors.black)),),
              decoration: BoxDecoration(border: Border.all(color: Colors.orange, width: 1)), padding: EdgeInsets.all(1),),
            SizedBox(width: 3,),
            Text(grams ? 'Grams': 'Lbs'),
          ],
        )
      ],
      ),
    );
  }
}