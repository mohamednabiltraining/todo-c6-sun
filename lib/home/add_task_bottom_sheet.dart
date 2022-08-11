import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add Task Details',
            style: Theme.of(context).textTheme.bodyMedium,),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title'
              ),
            ),
            SizedBox(height: 12,),
            TextFormField(
              maxLines: 4,
              minLines: 4,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                selectDate();
              },
              child: Text('select Date',style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.start,),
            ),
            SizedBox(height: 12,),
            ElevatedButton(
                onPressed: (){

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

  void selectDate(){
    showDatePicker(context: context, initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
  }
}
