 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/Data/Todo.dart';
 extension MyDateExtension on DateTime {
   DateTime getDateOnly() {
     return DateTime(this.year, this.month, this.day);
   }
 }
CollectionReference<todo>Gettodocollectionwithconverter(){
return FirebaseFirestore.instance.
 collection(todo.collectionName) .
 withConverter<todo>(fromFirestore:(snapshot, _) => todo.fromJson(snapshot.data()!) ,
     toFirestore: (item, _) => item.toJson());
}
Future<void> addtodofirestore(String title, String  descr, DateTime  dateTime)
 {
CollectionReference<todo> collectionReference=Gettodocollectionwithconverter();
DocumentReference<todo> docref =collectionReference.doc();
   todo item=
   todo( id: docref.id,title: title,
         description: descr,
        dateTime: dateTime.getDateOnly() );
  return docref.set(item);

 }
 Future< void> delettodo (todo item){
   CollectionReference<todo> collectionReference=Gettodocollectionwithconverter();
   DocumentReference<todo> itemDoc =collectionReference.doc(item.id);
   return itemDoc.delete();
 }