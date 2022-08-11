import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_c6_sun/my_theme.dart';

class TaskWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: .3,
            motion: DrawerMotion(),
            children: [
              SlidableAction(onPressed: (buildContext){},
                backgroundColor: MyTheme.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(12) ,
                  bottomLeft: Radius.circular(12)
                ),
              ),

            ],
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(width: 12,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('this is title',
                    style: Theme.of(context).textTheme.titleMedium,),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Icon(Icons.access_time),
                        Text('10.0Am',
                        style: Theme.of(context).textTheme.bodySmall,)
                      ],
                    )
                  ],
                )),
                SizedBox(width: 12,),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
                  child: Icon(Icons.check,color: Colors.white,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
