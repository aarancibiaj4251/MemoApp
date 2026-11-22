import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:nihongo_memo/components/memo_create_form.dart';
import 'package:nihongo_memo/models/memo.dart';

Future<void> createMemoDialog(BuildContext context) async {

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('メモを作成'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              MemoCreateForm(),
            ],
          ),
        ),
        actions: <Widget>[],
      );
    },
  );
}

List<NeatCleanCalendarEvent> buildMemos(Iterable<dynamic> memos) {
  return memos.map((memo) => 
      NeatCleanCalendarEvent
      (   memo.name,
          startTime: memo.createdAt,
          endTime: memo.createdAt,
          color: memo.color,
          metadata: Map<String, Memo>.from({ '${memo.id}': memo }),
      )
  )
  .toList();
}