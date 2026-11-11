import 'package:flutter/material.dart';
import 'package:nihongo_memo/components/memo_card.dart';
import 'package:nihongo_memo/models/memo.dart';

class Directory extends StatelessWidget {
  const Directory({super.key});

  @override
  Widget build(BuildContext context) {
    final Memo memo = ModalRoute.of(context)!.settings.arguments as Memo;
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning topic', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.deepPurple[200],
      body: Row(
        children: [
          Expanded(
            child: Container(
                      height: 400,
                      margin: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(25),
                      child: MemoCard(memo: memo),
                  ),
          ),
        ],
      ),
    );
  }
}