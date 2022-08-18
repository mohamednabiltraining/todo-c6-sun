import 'package:flutter/material.dart';
import 'package:todo_c6_sun/dialoges_utils.dart';
import 'package:todo_c6_sun/my_database/my_database.dart';
import 'package:todo_c6_sun/my_database/task.dart';

class AddTaskBottomSheet extends StatefulWidget {

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  var title = TextEditingController();
  var description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height* .7,
      padding: EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add Task Details',
            style: Theme.of(context).textTheme.bodyMedium,),
            TextFormField(
              controller: title,
              validator: (text){
                if(text==null ||text.trim().isEmpty){
                  return 'Please enter title';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Title'
              ),
            ),
            SizedBox(height: 12,),
            TextFormField(
              controller: description,
              validator: (text){
                if(text==null || text.trim().isEmpty){
                  return 'please enter description';
                }
                return null;
              },
              maxLines: 4,
              minLines: 4,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 12,),
            Text('select Date'),
            InkWell(
              onTap: (){
                selectDate();
              },
              // Todo: how to format date in dart YYYY/MM/dd
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('${selectedDate.year}/ ${selectedDate.month} /${selectedDate.day}',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SizedBox(height: 12,),
            ElevatedButton(
                onPressed: (){
                  submitForm();
            },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(12)
                  )
                ),
                child:Text('Submit',style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(color: Colors.white), ) )
          ],
        ),
      ),
    );
  }

  void submitForm(){
    if(formKey.currentState?.validate() == true){
      Task task = Task(
        title: title.text,
        desc: description.text,
        dateTime: dateOnly(selectedDate),
        isDone: false);
      showProgressDialog(context, 'Loading...',isCancelable: false);
      MyDataBase.addTask(task)
      .then((value){
        hideDialog(context);
        showMessage(context, 'Task Added Successfully',posActionName: 'ok',
        posAction: (){
          Navigator.pop(context);
        });
        // when success execution
      }).onError((error, stackTrace){
        hideDialog(context);
        showMessage(context, 'something went wrong, try again later',
        posActionName: 'ok');
      }).timeout(Duration(seconds: 5),onTimeout: (){
        hideDialog(context);
        showMessage(context, 'task saved locally',
        posActionName: 'ok',posAction: (){
          Navigator.pop(context);
            });

      });
    }
  }
  var selectedDate = DateTime.now();
  void selectDate()async{
    var choosenDate = await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(choosenDate!=null){
      setState(() {
        selectedDate = choosenDate;
      });
    }
  }
}
