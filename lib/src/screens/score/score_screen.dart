import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  ScoreScreen({Key? key}) : super(key: key);

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('scores');

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder(
            stream: collectionReference.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: snapshot.data!.docs
                      .map((e) => Column(
                            children: [
                              ListTile(
                                title: Text(e['player']),
                              ),
                              Divider(
                                color: Colors.black.withOpacity(0.6),
                                thickness: 2,
                              )
                            ],
                          ))
                      .toList(),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
