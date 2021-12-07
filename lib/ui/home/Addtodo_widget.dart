import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do/Data/Firestoreutils.dart';

class Addtodo_widget extends StatefulWidget {


  @override
  _Addtodo_widgetState createState() => _Addtodo_widgetState();
}

class _Addtodo_widgetState extends State<Addtodo_widget> {
  var formkey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  String title = '';
  String description ='';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Add to do',textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle1,),
            Form(
                key: formkey,
                child:

            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'title',
                      labelStyle: Theme.of(context).textTheme.subtitle1

                  ),
validator: (textValue){
      if (textValue==null || textValue.isEmpty){
        return 'please enter the task title';
      }
      return null;
},
                  onChanged: (text){
                    title=text;
                  },

                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',

                  ),

                  minLines:4 ,
                  maxLines:4 ,
                    validator: (text){
                      if (text==null || text.isEmpty){
                        return 'please enter the task Description';
                      }
                      return null;
                  },
                  onChanged: (text){
                    description=text;
                  },
                ),
              ],
            )
            ),

        Text('date'),
       InkWell(
         onTap: (){
           ShowDateDialge();
         },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',textAlign: TextAlign.center,),
          ),
        ),
        ElevatedButton(onPressed: (){
addTodo();
        }, child: Text('add')),

      ],

    ),

    );
  }
  void addTodo() {
    if (!formkey.currentState!.validate()) {
      return;
    }
    addtodofirestore(title, description, selectedDate)
        .then((value) {
      Fluttertoast.showToast(
          msg: "Task added successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      print('Error');
    }).timeout(Duration(seconds: 10), onTimeout: () {
      print('Error2');
    });
  }

  void ShowDateDialge()async{
    var newSelectedDate = await
    showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
  if (newSelectedDate!=null){
    selectedDate=newSelectedDate;
    setState(() {});
  }

  }

}
