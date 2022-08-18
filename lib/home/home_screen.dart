import 'package:flutter/material.dart';
import 'package:todo_c6_sun/home/add_task_bottom_sheet.dart';
import 'package:todo_c6_sun/home/settings/settings.dart';
import 'package:todo_c6_sun/home/todo_list/todo_list_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('c6 Todo App'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> showAddBottomSheet(),
        child: Icon(Icons.add),
        shape: StadiumBorder(
          side: BorderSide(color: Colors.white,width: 4)
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12 ,
        child: BottomNavigationBar(
          currentIndex: selectedIndex ,
          onTap: (index){
            setState(() {
              selectedIndex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list),
            label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings),
            label: ''),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }
  var tabs = [TodoListTab(),SettingsTab()];
  void showAddBottomSheet(){
    showModalBottomSheet(context: context, builder: (buildcontext){
      return AddTaskBottomSheet();
    },isScrollControlled: true);
  }
}
