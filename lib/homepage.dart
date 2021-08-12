import 'package:flutter/material.dart';
// import 'package:intern_task/appdata.dart';
import 'package:intern_task/assistant.dart';
import 'package:intern_task/models/quiztype.dart';

import 'package:intern_task/quiz.dart';
import 'package:intern_task/quiz1.dart';
// import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var url = "http://perceptiondraft.com/api/gbas00721-cat.php";

  late Future<List<QuizType>> _quiztype;

  @override
  void initState() {
    _quiztype = AssistantMethods.getRequest(url);
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
            Positioned(
              top: 2.0,
              left: 15.0,
              right: 15.0,
              child: Center(child: Text("Available Quiz")),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: FutureBuilder<List<QuizType>>(
                future: _quiztype,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 30.0,
                              ),
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                color: Colors.grey[300],
                                onPressed: () {
                                  print("Hello$index");
                                  if (index == 1) {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => Quiz(
                                    //         apilink:
                                    //             "http://perceptiondraft.com/api/gbas00721-quiz.php?cid=2"),
                                    //   ),
                                    // );
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Quiz(
                                          apilink:
                                              "http://perceptiondraft.com/api/gbas00721-quiz.php?cid=2",
                                        ),
                                      ),
                                      (route) => false,
                                    );
                                  } else if (index == 0) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Quiz1(
                                            apilink:
                                                "http://perceptiondraft.com/api/gbas00721-quiz.php?cid=1"),
                                      ),
                                      (route) => false,
                                    );
                                  }
                                },
                                child: Row(
                                  children: [
                                    // Icon(
                                    //   Image.network(snapshot.data!.apilink.toString()),
                                    //   size: 100.0,
                                    // ),
                                    Image.network(
                                      snapshot.data![index].img,
                                      height: 100,
                                      width: 100,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          snapshot.data![index].name,
                                          style: TextStyle(
                                            fontSize: 22.0,
                                          ),
                                        ),
                                        Text(
                                          "Difficulty: Basic",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 11.0,
                                          ),
                                        ),
                                        Text(
                                          "100/20,000+ Questions",
                                          style: TextStyle(
                                            fontSize: 11.0,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Positioned(
              bottom: 20,
              left: 30,
              right: 30,
              child: Column(
                children: [
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(Size.fromHeight(60)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green[400]),
                        elevation: MaterialStateProperty.all(5),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        print("Button");
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Quiz(
                                apilink:
                                    "http://perceptiondraft.com/api/gbas00721-quiz.php?cid=2"),
                          ),
                          (route) => false,
                        );
                      },
                      child: Center(
                        child: Text(
                          "Instant Quiz",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                          "Candidate ID: Souvik_souvikbanerjee73@gmail.com"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
