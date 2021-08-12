import 'package:flutter/material.dart';
import 'package:intern_task/appdata.dart';
import 'package:intern_task/assistant.dart';
import 'package:intern_task/models/qanda.dart';
import 'package:intern_task/result.dart';
import 'package:provider/provider.dart';

class Quiz extends StatefulWidget {
  // final String apilink = "http://perceptiondraft.com/api/gbas00721-quiz.php?cid=2";
  final String apilink;
  Quiz({required this.apilink});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late Future<List<QuesAndAns>> _quiztype;

  String pressed = '0';
  String rightanswer = '1';

  @override
  void initState() {
    _quiztype = AssistantMethods.getRequestforqanda(widget.apilink.toString());
    // _quiztype = new List<QuizType>.from(_quiztypelist) as Future<List<QuizType>>;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            width: 100.0,
            child: Image.asset("assets/logo.png"),
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            FutureBuilder<List<QuesAndAns>>(
              future: _quiztype,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Consumer<AppData>(builder: (context, provider, child) {
                    rightanswer = snapshot.data![provider.questioncount].co;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 80.0,
                                  color: Colors.teal,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Calender System",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Level-1",
                                          style: TextStyle(
                                            fontSize: 11.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          snapshot
                                              .data![provider.questioncount].q,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: provider.borderColor1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                child: provider.optionIcon1,
                                                backgroundColor:
                                                    provider.bgColor1,
                                                radius: 14.0,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Text(
                                                snapshot
                                                    .data![
                                                        provider.questioncount]
                                                    .o1,
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        print("option1");
                                        pressed = snapshot
                                            .data![provider.questioncount].o1;
                                        if (pressed == rightanswer) {
                                          provider.o1correct();
                                          provider.o2unselected();
                                          provider.o3unselected();
                                          provider.o4unselected();
                                          provider.submit();
                                        } else {
                                          provider.o1wrong();
                                          provider.o2unselected();
                                          provider.o3unselected();
                                          provider.o4unselected();
                                          provider.skip();
                                        }
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: provider.borderColor2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                child: provider.optionIcon2,
                                                backgroundColor:
                                                    provider.bgColor2,
                                                radius: 14.0,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Text(
                                                snapshot
                                                    .data![
                                                        provider.questioncount]
                                                    .o2,
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        print(
                                            "option2${snapshot.data![Provider.of<AppData>(context, listen: false).questioncount].o2}");
                                        pressed = snapshot
                                            .data![provider.questioncount].o2;
                                        if (pressed == rightanswer) {
                                          provider.o2correct();
                                          provider.o1unselected();
                                          provider.o3unselected();
                                          provider.o4unselected();
                                          provider.submit();
                                        } else {
                                          provider.o2wrong();
                                          provider.o1unselected();
                                          provider.o3unselected();
                                          provider.o4unselected();
                                          provider.skip();
                                        }
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: provider.borderColor3,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                child: provider.optionIcon3,
                                                backgroundColor:
                                                    provider.bgColor3,
                                                radius: 14.0,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Text(
                                                snapshot
                                                    .data![
                                                        provider.questioncount]
                                                    .o3,
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        print("option3");
                                        pressed = snapshot
                                            .data![Provider.of<AppData>(context,
                                                    listen: false)
                                                .questioncount]
                                            .o3;
                                        if (pressed == rightanswer) {
                                          provider.o3correct();
                                          provider.o1unselected();
                                          provider.o2unselected();
                                          provider.o4unselected();
                                          provider.submit();
                                        } else {
                                          provider.o3wrong();
                                          provider.o1unselected();
                                          provider.o2unselected();
                                          provider.o4unselected();
                                          provider.skip();
                                        }
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: provider.borderColor4,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: CircleAvatar(
                                                child: provider.optionIcon4,
                                                backgroundColor:
                                                    provider.bgColor4,
                                                radius: 14.0,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Text(
                                                snapshot
                                                    .data![
                                                        provider.questioncount]
                                                    .o4,
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        print("option4");
                                        pressed = snapshot
                                            .data![Provider.of<AppData>(context,
                                                    listen: false)
                                                .questioncount]
                                            .o4;
                                        if (pressed == rightanswer) {
                                          provider.o4correct();
                                          provider.o1unselected();
                                          provider.o2unselected();
                                          provider.o3unselected();
                                          provider.submit();
                                        } else {
                                          provider.o4wrong();
                                          provider.o1unselected();
                                          provider.o2unselected();
                                          provider.o3unselected();
                                          provider.skip();
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            Positioned(
              bottom: 5,
              left: 30,
              right: 30,
              child: Consumer<AppData>(builder: (context, provider, child) {
                return Column(
                  children: [
                    Center(
                      child: Text(provider.restext),
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(Size.fromHeight(60)),
                          backgroundColor:
                              MaterialStateProperty.all(provider.submitButton),
                          elevation: MaterialStateProperty.all(5),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              side: BorderSide(color: provider.submitTextColor),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          print("Button");
                          if (pressed == rightanswer) {
                            print("correct Answer");
                            provider.updatescore();
                          } else {
                            print("Wrong Answer");
                          }
                          if (provider.questioncount < 4) {
                            provider.updateQuestionCount();
                            provider.o1unselected();
                            provider.o2unselected();
                            provider.o3unselected();
                            provider.o4unselected();
                            provider.normalsubmitbutton();
                          } else {
                            provider.questioncount = 0;
                            provider.o1unselected();
                            provider.o2unselected();
                            provider.o3unselected();
                            provider.o4unselected();
                            provider.normalsubmitbutton();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Result(
                                  score: provider.score,
                                ),
                              ),
                              (route) => false,
                            );
                          }
                        },
                        child: Center(
                          child: Text(
                            provider.submitText,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: provider.submitTextColor,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                            "Candidate ID: Souvik_souvikbanerjee73@gmail.com"),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
