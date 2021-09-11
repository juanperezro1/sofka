import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseManager {
    final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('scores');

  Future getScorePlayers () async {
    List scoreList = [];

    try {
      await collectionReference.get().then((querySnapchot) => {
        querySnapchot.docs.forEach((element) {
          scoreList.add(element.data());
         })
      });
      return scoreList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> addScorePlayer (String player, String score) async {
    await collectionReference.add({'player': player, 'score': score});
  }
}