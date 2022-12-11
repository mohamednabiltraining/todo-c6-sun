import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/dialoges_utils.dart';
import 'package:todo_app/home/todo_list/edit_screen.dart';
import 'package:todo_app/my_database/my_database.dart';
import 'package:todo_app/my_database/task.dart';
import 'package:todo_app/my_theme.dart';

import '../provider/app_provider.dart';

class TaskWidget extends StatelessWidget {
  Task task;

  TaskWidget(this.task);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditScreen(task),
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: .3,
            motion: DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (buildContext) {
                  MyDataBase.deleteTask(task).then((value) {
                    showMessage(context, 'task deleted successfully',
                        posActionName: 'ok');
                  }).onError((error, stackTrace) {
                    showMessage(
                        context,
                        'error deleteing task,'
                        'try again later',
                        posActionName: 'ok');
                  }).timeout(Duration(seconds: 5), onTimeout: () {
                    showMessage(context, 'task removed locally',
                        posActionName: 'ok');
                  });
                },
                backgroundColor: MyTheme.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
                color: provider.isDark() ? Color(0xFF141922) : Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 6,
                  decoration: BoxDecoration(
                    color: task.isDone!
                        ? MyTheme.green
                        : Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: task.isDone!
                                    ? MyTheme.green
                                    : Theme.of(context).primaryColor)),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          task.desc ?? "",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    )
                  ],
                )),
                SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {
                    MyDataBase.editIsDone(task);
                  },
                  child: task.isDone!
                      ? Text(
                          "Done !",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: MyTheme.green),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
