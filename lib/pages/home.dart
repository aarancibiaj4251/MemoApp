import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:nihongo_memo/components/memo_schedule.dart';
import 'package:nihongo_memo/utils/constants.dart';
import 'package:nihongo_memo/utils/functions.dart';
import 'package:hive_ce/hive_ce.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var isAllowedBuildFloatingButton = true;

  @override
  Widget build(BuildContext context) {

    var memoBox = Hive.box(MEMO_ENTITY);

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
        body: memoBox.isEmpty ? buildNoMemos(context) : MemoSchedule(),
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