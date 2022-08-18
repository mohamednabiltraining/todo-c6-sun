import 'package:flutter/material.dart';

void showMessage(BuildContext context,String message,
    {String? posActionName,VoidCallback? posAction,
    String? negActionName,VoidCallback? negAction}
    ){
  showDialog(context: context, builder: (buildContext){
    List<Widget> actions = [];
    if(posActionName!=null){
      actions.add(
        TextButton(onPressed: (){
          Navigator.pop(buildContext);
          if(posAction!=null)
            posAction();
        }, child: Text(posActionName)),);
    }
    if(negActionName!=null){
      actions.add(
        TextButton(onPressed: (){
          Navigator.pop(context);
          if(negAction!=null){
            negAction();
          }
        }, child: Text(negActionName)),);
    }

    return AlertDialog(
      content: Text(message),
      actions: actions,
    );
  });
}
void showProgressDialog(BuildContext context,
    String message,{bool isCancelable =true}){
  showDialog(context: context, builder: (buildContext){
    return AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 12,),
          Text(message)
        ],
      ),
    );
  },barrierDismissible: true);
}
void hideDialog(BuildContext context){
  Navigator.pop(context);
}
DateTime dateOnly(DateTime input){
  return DateTime(input.year,input.month,input.day);
}