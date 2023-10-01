import 'package:sqflite/sqflite.dart';

import '../models/note.dart';
class MyDatabase {

 static late Database database;




 static Future<void> initDatabase()async{
  String pathDatabase = await getDatabasesPath();
  pathDatabase += 'database.db';

  database = await openDatabase(
      pathDatabase,
      version: 1,

   onCreate: (database,version){
       print('Create Database !!');

       database.execute(
           'CREATE TABLE NOTE (id INTEGER PRIMARY KEY,title TEXT,description TEXT, date TEXT, finish BOOLEAN)'

       ).then((value){
         print('TABLE NOTE IS CREATED !!');
       }).catchError((error){
         print(error.toString());
       });
   },

    onOpen: (database){
        print('OPEN DATABASE !!');
    },

  );



 }

 static Future<int> insertRow({required title,required description,required date})async{
   int result = -1;
  await database.insert(
       'NOTE',
       {
         'title': title,
         'description' : description,
         'date' : date,
         'finish' : 0,
       },
   ).then((value){
     result = value;
     print('$value is Inserted successfully');
   }).catchError((error){
     print(error.toString());
   });

   return result;
 }



 static Future<List<Map<String,dynamic>>> getAllDate()async{
   List<Map<String,dynamic>> result = [];

   await database.rawQuery('SELECT * FROM NOTE').then((value){
         result = value;
   }).catchError((error){
     print(error.toString());
   });

   return result;
 }

 static Future<void> updateRow({required int id,required bool finish})async{
   database.update(
       'NOTE',
     {
       'finish' : finish? 1:0,
     },

     where: 'id=?',
     whereArgs: [id],

   ).then((value){
     print("$value is Updated Successfully");
   }).catchError((error){
     print(error.toString());
   });
 }


 static Future<void> updateAllRow({required int id, required  title,required description,required date})async{
   database.update(
     'NOTE',
     {
       'title' : title,
       'description' : description,
       'date' : date,


     },

     where: 'id=?',
     whereArgs: [id],

   ).then((value){
     print("$value is Updated Successfully");
   }).catchError((error){
     print(error.toString());
   });
 }

 static Future<void> deleteRow({required id})async{
   database.delete(
       'NOTE',
     where: 'id=?',
     whereArgs: [id],

   ).then((value){
     print('$value is deleted successfully');
   }).catchError((error){
     print(error.toString());
   });
 }

}