

import 'package:flutter/material.dart';
import 'package:to_do/ui/home/seting%20tap.dart';

import 'Addtodo_widget.dart';
import 'TodiList.dart';


class HomeScreen extends StatefulWidget {
static const String routeName='home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('todoList'),
        elevation: 0,
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.white,width:4
          )
        ),
        child: Icon(Icons.add),
        onPressed: (){
          ShowAddTodoSheet();
        },
      ),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
bottomNavigationBar: BottomAppBar(

  elevation: 0,
  child: BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: (index){
      currentIndex=index;
      setState(() {

      });
    },
    elevation: 0,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: [
      BottomNavigationBarItem(label: '',
          icon: Icon(Icons.list)),
      BottomNavigationBarItem(label: '',
          icon: Icon(Icons.settings)),
    ],
  ),
  clipBehavior: Clip.antiAlias,
  shape: CircularNotchedRectangle(),
  notchMargin: 10,
),
        body: Taps[currentIndex],
    );
  }
  List<Widget>Taps=[

    TodoLis(),
    setingTap(),
  ];
  void ShowAddTodoSheet(){
    showModalBottomSheet(context: context, builder: (buildContext){
      return  Addtodo_widget();
    });
  }
}


