import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/provider/app_provider.dart';
import 'package:todo_app/home/todo_list/task_widget.dart';
import 'package:todo_app/my_database/my_database.dart';
import 'package:todo_app/my_database/task.dart';

class TodoListTab extends StatefulWidget {
  @override
  State<TodoListTab> createState() => _TodoListTabState();
}

class _TodoListTabState extends State<TodoListTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              if (date == null) return;
              setState(() {
                selectedDate = date;
              });
            },
            showYears: true,
            leftMargin: 20,
            monthColor: provider.isDark() ? Colors.white : Colors.black,
            dayColor: provider.isDark() ? Colors.white : Colors.black,
            activeDayColor: Theme.of(context).primaryColor,
            activeBackgroundDayColor:
                provider.isDark() ? Color(0xFF141922) : Colors.white,
            selectableDayPredicate: (date) {
              return true;
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
                  }))
        ],
      ),
    );
  }
}
