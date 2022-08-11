import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_c6_sun/home/todo_list/task_widget.dart';

class TodoListTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            showYears: true,
            leftMargin: 20,
            monthColor: Colors.black,
            dayColor: Colors.black,
            activeDayColor: Theme.of(context).primaryColor,
            activeBackgroundDayColor: Colors.white,
            selectableDayPredicate: (date) {
              return true;
              //   return !(date.weekday == DateTime.friday ||date.weekday==DateTime.saturday);
            },
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (buildContext,index){
              return TaskWidget();
            },itemCount: 10,),
          )
        ],
      ),
    );
  }
}
