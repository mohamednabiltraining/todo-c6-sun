import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/provider/tasks_provider.dart';
import 'package:todo_app/my_database/my_database.dart';
import 'package:todo_app/my_database/task.dart';
import 'package:todo_app/my_theme.dart';

class EditScreen extends StatefulWidget {
  static const String routName = "edit_screen";
  Task task;

  EditScreen(this.task);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TasksProvider provider;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    provider = Provider.of(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: Container(
                width: double.infinity,
                height: size.height * 0.2,
                color: MyTheme.lightPrimary,
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "To Do List",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 120,
              child: Container(
                width: size.height * 0.85,
                height: size.height * 0.7,
                padding: EdgeInsets.only(
                  top: 35,
                  left: 30,
                  right: 30,
                  bottom: 80,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      "Edit Task",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            initialValue: widget.task.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                            onChanged: (String? value) {
                              widget.task.title = value;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            initialValue: widget.task.desc,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                            onChanged: (String? value) {
                              widget.task.desc = value;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Select Date",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              selecteDate();
                            },
                            child: Text(
                              "${selectedDate.year} / ${selectedDate.month} / ${selectedDate.day}",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    MaterialButton(
                      onPressed: () {
                        editTask();
                      },
                      minWidth: 255,
                      height: 55,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        "Save Changes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onSubmited() {
    if (formKey.currentState!.validate()) {
      print("Done");
    }
  }

  var selectedDate = DateTime.now();

  void selecteDate() async {
    var choosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (choosenDate != null) {
      setState(() {
        selectedDate = choosenDate;
      });
    }
  }

  void editTask() {
    MyDataBase.editTaskDetails(widget.task).then((value) {
      Navigator.pop(context);
      CircularProgressIndicator();
      //provider.notifyListeners();
      print("Success");
    }).catchError((error){
      print(error);
    });
  }
}
