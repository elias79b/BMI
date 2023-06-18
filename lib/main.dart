import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? _selectedValueIndex;
  List<String> buttonText = ["Man", "Female"];

  Widget button({required String text, required int index}) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 70, left: 70),
      child: InkWell(
        // splashColor: Colors.cyanAccent,
        onTap: () {
          setState(() {
            _selectedValueIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(),
              color: index == _selectedValueIndex ? Colors.blue : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 90,
          height: 70,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color:
                    index == _selectedValueIndex ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                margin: new EdgeInsets.only(right: 350, top: 25),
                child: Text("BMI Calculator",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20))),
            Row(
              children: [
                ...List.generate(
                  buttonText.length,
                  (index) => button(
                    index: index,
                    text: buttonText[index],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 40),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Height(cm)',
                  hintText: 'Enter Your Height(cm)',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 25),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Age',
                  hintText: 'Enter Your Age',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 25),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Weight (kg)',
                  hintText: 'Enter Weight (kg)',
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: SolidBottomSheet(
        headerBar: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: new EdgeInsets.only(bottom: 30),
              child: Center(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      onPressed: () {},
                      child: const Row(
                        children: [Text("BMI"), Icon(Icons.arrow_circle_up)],
                      )),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.blueAccent),
          // height: 30,
          child:  const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Your BMI is",
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "19.6 kg/m",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "(Normal)",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                  child: Text(
                    "Hello! I'm a bottom sheet :D"
                    "Hello! I'm a bottom sheet :D"
                    "Hello! I'm a bottom sheet :D"
                    "Hello! I'm a bottom sheet :D"
                    "Hello! I'm a bottom sheet :D"
                    "Hello! I'm a bottom sheet :D"
                    "Hello! I'm a bottom sheet :D"
                    "Hello! I'm a bottom sheet :D"
                    "",
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.share),
                    Icon(Icons.bookmark_border),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
