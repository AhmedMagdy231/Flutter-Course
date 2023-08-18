void main(){
 //     index: 0  1  2  3  4  5   6   7 
 final list = [1, 2, 4, 5, 8, 10, 12, 14];

 final result2 = list.where((element) => (element % 2==0 && list.indexOf(element) % 2 ==0));
 print(result2);

 List<int> result =[];
 for(int i=0; i< list.length; i++){
  if(list[i] % 2 ==0 && i % 2 ==0){
    result.add(list[i]);
  }
 }
 print(result);


list.indexOf(14);

 


}



// 4 8 12