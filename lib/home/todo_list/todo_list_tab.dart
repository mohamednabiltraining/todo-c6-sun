import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_c6_sun/home/todo_list/task_widget.dart';
import 'package:todo_c6_sun/my_database/my_database.dart';
import 'package:todo_c6_sun/my_database/task.dart';

class TodoListTab extends StatefulWidget {
  @override
  State<TodoListTab> createState() => _TodoListTabState();
}

class _TodoListTabState extends State<TodoListTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              if(date==null)return;
              setState(() {
                selectedDate = date;
              });
            },
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
              child: StreamBuilder<QuerySnapshot<Task>>(
                  stream: MyDataBase.listenForTasksUpates(selectedDate),
                  builder: (buldContext, snapshot) {
                    if (snapshot.hasError) {
                      // todo: show try again button
                      return Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    var data =
                        snapshot.data?.docs.map((e) => e.data()).toList();
                    return ListView.builder(
                      itemBuilder: (_, index) {
                        return TaskWidget(data![index]);
                      },
                      itemCount: (data?.length) ?? 0,
                    );
                  })
              // FutureBuilder<QuerySnapshot<Task>>(
              //   future: MyDataBase.getTasks(),
              //   builder: (buldContext,snapshot){
              //     if(snapshot.hasError){
              //       // todo: show try again button
              //       return Text('Something went wrong');
              //     }
              //     if(snapshot.connectionState == ConnectionState.waiting){
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //     var data =  snapshot.data?.docs.map((e) => e.data()).toList();
              //     return ListView.builder(itemBuilder: (_,index){
              //       return TaskWidget(data![index]);
              //     },itemCount: (data?.length)??0,);
              //
              //   },
              // ),
              )
        ],
      ),
    );
  }
}
