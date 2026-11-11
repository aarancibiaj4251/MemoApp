import 'package:flutter/material.dart';
import 'package:nihongo_memo/components/memo_schedule.dart';
import 'package:nihongo_memo/utils/functions.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nihongo Memo', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: MemoSchedule(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => createMemoDialog(context),
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add, color: Colors.white),
        ),
      );
  }

}