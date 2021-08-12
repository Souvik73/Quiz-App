import 'package:flutter/material.dart';
import 'package:intern_task/appdata.dart';
import 'package:intern_task/homepage.dart';
import 'package:provider/provider.dart';

class Result extends StatefulWidget {
  final int score;
  const Result({required this.score});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            width: 100.0,
            child: Image.asset("assets/logo.png"),
          ),
        ),
        elevation: 0.0,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          
            child: Text("Candidate id: Souvik_souvikbanerjee73@gmail.com"),
          
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your Score is: ${widget.score}/5",
              style: TextStyle(
                fontSize: 28.0,
                color: widget.score >= 3 ? Colors.green : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Provider.of<AppData>(context, listen: false).score = 0;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                  (route) => false,
                );
              },
              child: Center(
                child: Text(
                  "Go back to HomePage",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size.fromHeight(60)),
                backgroundColor: MaterialStateProperty.all(Colors.green),
                elevation: MaterialStateProperty.all(5),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
