void main(){

Map<String, dynamic> data1 = {
  "Name" : "Ahmed",
   "Age" : 21,
   "isMale" : true,
   "Scores" : [100,50,30],
   
};

Map<String, dynamic> data2 = {
  "Name" : "Sara",
   "Age" : 30,
   "isMale" : true,
   "Scores" : [70,20,10],
};

List<Map<String,dynamic>>  myData = [data1,data2];



myData.forEach((element) { 
  print(element['Name']);
});











}