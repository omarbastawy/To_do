import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do/Data/Firestoreutils.dart';
import 'package:to_do/Data/Todo.dart';
import 'package:to_do/ui/home/todo_Widget.dart';

class TodoLis extends StatefulWidget {
  @override
  _TodoLisState createState() => _TodoLisState();
}

class _TodoLisState extends State<TodoLis> {
  DateTime selectedDay = DateTime.now();
  DateTime FocusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TableCalendar(
              selectedDayPredicate: (day) {
                return isSameDay(selectedDay, day);
              },
              onDaySelected: (sDay, fDay) {
                setState(() {
                  selectedDay = sDay;
                  FocusedDay = fDay; // update `_focusedDay` here as well
                });
              },
              daysOfWeekStyle: DaysOfWeekStyle(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  weekdayStyle: TextStyle(color: Colors.black)),
              weekendDays: [],
              calendarStyle: CalendarStyle(
                  selectedTextStyle: TextStyle(color: Colors.white),
                  selectedDecoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  todayDecoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  defaultDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  defaultTextStyle: TextStyle(color: Colors.black)),
              calendarFormat: CalendarFormat.week,
              focusedDay: FocusedDay,
              firstDay: DateTime.now().subtract(Duration(days: 365)),
              lastDay: DateTime.now().add(Duration(days: 365))),
          Expanded(
              child: StreamBuilder<QuerySnapshot<todo>>(
                  stream: Gettodocollectionwithconverter()
                      .where('dateTime', isEqualTo: selectedDay.getDateOnly().millisecondsSinceEpoch)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<todo>> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error');

                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    List<todo> items =
                        snapshot.data!.docs.map((doc) => doc.data()).toList();
                    return ListView.builder(
                      itemBuilder: (buildContext, index) {
                        return TaskItem(items[index]);
                      },
                      itemCount: items.length,
                    );
                  }))
        ],
      ),
    );
  }
}
