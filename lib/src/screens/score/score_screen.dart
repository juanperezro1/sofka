import 'package:flutter/material.dart';
import 'package:prueba/src/databasemanager/data_base_manager.dart';
import 'package:prueba/src/utils/constants.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  List scoreList = [];

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic resultant = await DataBaseManager().getScorePlayers();

    if (resultant == null) {
    } else {
      setState(() {
        scoreList = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (scoreList.isNotEmpty) {
      return Scaffold(
          body: Column(children: [
        SizedBox(
          height: size.height * 0.1,
        ),
        const Text(
          "Player Scores",
          style: TextStyle(
              fontSize: 40, fontFamily: 'Sofia Pro', color: kPrimaryColor),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: scoreList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(scoreList[index]['player']),
                    trailing: Text('Score ' '${scoreList[index]['score']}'),
                  ),
                );
              }),
        )
      ]));
    }
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
