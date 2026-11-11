import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:hive_ce/hive_ce.dart';
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

List<NeatCleanCalendarEvent> buildMemos(Box<dynamic> memos) {


  const colors = [Colors.blueAccent, Colors.pink, Colors.deepPurpleAccent, Colors.amberAccent];

  ColorSwatch<int> randomColor() {
    return colors[Random().nextInt(4)];
  }

  Iterable<NeatCleanCalendarEvent> eventList = memos.values.map((memo) => 
      NeatCleanCalendarEvent
      (   memo.name,
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          color: randomColor(),
          metadata: Map<String, Memo>.from({ '${memo.id}': memo }),
      )
  );

  var calendarItems = eventList.toList();
  calendarItems.addAll([
    NeatCleanCalendarEvent('MultiDay Event A',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.blueAccent,
          metadata: Map<String, String>.from({ 'settings': 'activate again in 1 week' }),
          isMultiDay: true),
          NeatCleanCalendarEvent('Allday Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink,
          metadata: Map<String, String>.from({ 'settings': 'activate again in next sunday' }),
          isAllDay: true),
  ]);


  return calendarItems;
}