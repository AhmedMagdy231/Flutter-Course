class Note {
  late int id;
  late String title;
  late String description;
  late String date;
   bool finish = false;


  Note({required this.id,required this.title,required this.description,required this.date});

  Note.fromJson(Map<String,dynamic> data){
    int x =5;
    this.id = data['id'];
    this.title = data['title'];
    this.description = data['description'];
    this.date = data['date'];
    this.finish = data['finish'] == 1? true: false;

  }

}