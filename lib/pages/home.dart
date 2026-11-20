import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:nihongo_memo/components/memo_schedule.dart';
import 'package:nihongo_memo/utils/constants.dart';
import 'package:nihongo_memo/utils/functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isAllowedBuildFloatingButton = true;

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
        body: ValueListenableBuilder<Box>(
          valueListenable: Hive.box(MEMO_ENTITY).listenable(), 
          builder: (context, box, widget) {
            return box.isEmpty ? buildNoMemos(context) : MemoSchedule();
          }
        ),
        floatingActionButton: isAllowedBuildFloatingButton ? FloatingActionButton(
          onPressed: () => createMemoDialog(context),
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add, color: Colors.white),
        ) : null,
      );
  }

  bool allowedBuildFloatingButton() {
    return isAllowedBuildFloatingButton;
  }

  Widget buildNoMemos(context) {
    isAllowedBuildFloatingButton = false;
    return Row(
        children: [
          Expanded(
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('メモを作成しましょうか'),
                FilledButton.icon(
                  icon: Icon(Icons.edit),
                  label: Text('すぐに作成する'),
                  onPressed: () => createMemoDialog(context),
                  )
              ],
            ),
          ),
        ],
      );
  }
}