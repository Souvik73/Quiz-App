import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  List<String> questions = [];
  int questioncount = 0;

  Color borderColor1 = Colors.black;
  Icon optionIcon1 = Icon(Icons.circle, color: Colors.grey,);
  Color bgColor1 = Colors.grey;

  Color borderColor2 = Colors.black;
  Icon optionIcon2 = Icon(Icons.circle, color: Colors.grey,);
  Color bgColor2 = Colors.grey;

  Color borderColor3 = Colors.black;
  Icon optionIcon3 = Icon(Icons.circle, color: Colors.grey,);
  Color bgColor3 = Colors.grey;

  Color borderColor4 = Colors.black;
  Icon optionIcon4 = Icon(Icons.circle, color: Colors.grey,);
  Color bgColor4 = Colors.grey;

  Color submitButton = Colors.white;
  String submitText = "Skip";
  Color submitTextColor = Colors.red;
  String restext = "";
  int score = 0;

  void updatescore(){
    score = score+1;
    notifyListeners();
  }

  void updateQuestions(String ques) {
    questions.add(ques);
    notifyListeners();
  }
  void updateQuestionCount(){
    questioncount += 1;
    notifyListeners();
  }
  void o1correct() {
    borderColor1 = Colors.green;
    optionIcon1 = Icon(Icons.done);
    bgColor1 = Colors.green;
    notifyListeners();
  }
  void o2correct() {
    borderColor2 = Colors.green;
    optionIcon2 = Icon(Icons.done);
    bgColor2 = Colors.green;
    notifyListeners();
  }
  void o3correct() {
    borderColor3 = Colors.green;
    optionIcon3 = Icon(Icons.done);
    bgColor3 = Colors.green;
    notifyListeners();
  }
  void o4correct() {
    borderColor4 = Colors.green;
    optionIcon4 = Icon(Icons.done);
    bgColor4 = Colors.green;
    notifyListeners();
  }
  void o1wrong() {
    borderColor1 = Colors.red;
    optionIcon1 = Icon(Icons.close);
    bgColor1 = Colors.red;
    notifyListeners();
  }
  void o2wrong() {
    borderColor2 = Colors.red;
    optionIcon2 = Icon(Icons.close);
    bgColor2 = Colors.red;
    notifyListeners();
  }
  void o3wrong() {
    borderColor3 = Colors.red;
    optionIcon3 = Icon(Icons.close);
    bgColor3 = Colors.red;
    notifyListeners();
  }
  void o4wrong() {
    borderColor4 = Colors.red;
    optionIcon4 = Icon(Icons.close);
    bgColor4 = Colors.red;
    notifyListeners();
  }
  void o1unselected() {
    borderColor1 = Colors.black;
    optionIcon1 = Icon(Icons.circle, color: Colors.grey,);
    bgColor1 = Colors.grey;
    notifyListeners();
  }
  void o2unselected() {
    borderColor2 = Colors.black;
    optionIcon2 = Icon(Icons.circle, color: Colors.grey,);
    bgColor2 = Colors.grey;
    notifyListeners();
  }
  void o3unselected() {
    borderColor3 = Colors.black;
    optionIcon3 = Icon(Icons.circle, color: Colors.grey,);
    bgColor3 = Colors.grey;
    notifyListeners();
  }
  void o4unselected() {
    borderColor4 = Colors.black;
    optionIcon4 = Icon(Icons.circle, color: Colors.grey,);
    bgColor4 = Colors.grey;
    notifyListeners();
  }
  void skip() {
    submitButton = Colors.white;
    submitText = "Skip";
    submitTextColor = Colors.red;
    restext = "Too Hard! Go to next Question";
    notifyListeners();
  }
  void submit() {
    submitButton = Colors.green;
    submitText = "Next";
    submitTextColor = Colors.white;
    restext = "Awesome! Try another  One";
    notifyListeners();
  }
  void normalsubmitbutton()
  {
    submitButton = Colors.white;
    submitText = "Skip";
    submitTextColor = Colors.red;
    restext = "";
    notifyListeners();
  }
}