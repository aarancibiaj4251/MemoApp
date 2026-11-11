import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:hive_ce/hive_ce.dart';

import 'package:nihongo_memo/utils/constants.dart';
import 'package:nihongo_memo/utils/functions.dart';

void main() {
  runApp(MemoSchedule());
}

class MemoSchedule extends StatelessWidget {
  const MemoSchedule({super.key});

  @override
  Widget build(BuildContext context) {

    final memoBox = Hive.box(MEMO_ENTITY);

    print('MEMOS: ${memoBox.values.length}');

    final List<NeatCleanCalendarEvent> eventList = buildMemos(memoBox);

    void onEventSelected(NeatCleanCalendarEvent event) {
      Navigator.pushNamed(context, '/directory', arguments: event.metadata!.entries.first.value);
    }

    void onDateSelected(DateTime value) {
      print(value.day);
    }

    if (memoBox.isEmpty) {
      return Text('No memos found');
    }

    return Calendar(
        startOnMonday: true,
        weekDays: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
        eventsList: eventList,
        isExpandable: true,
        eventDoneColor: Colors.green,
        selectedColor: Colors.pink,
        selectedTodayColor: Colors.red,
        todayColor: Colors.teal,
        eventColor: null,
        locale: 'ja_JP',
        todayButtonText: '今日',
        allDayEventText: '一日',
        multiDayEndText: 'Ende',
        isExpanded: true,
        expandableDateFormat: 'EEEE, dd. MMMM yyyy',
        datePickerType: DatePickerType.hidden,
        onDateSelected: (value) => onDateSelected(value),
        forceEventListView: true,
        showEventListViewIcon: false,
        dayOfWeekStyle: 
                        TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11
                        ),
        onEventSelected: (e) => onEventSelected(e),
      );
  }
}