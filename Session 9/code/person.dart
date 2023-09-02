class Person{
  String? name;
  String? address;

  Person(String name ,String address){
    this.name = name;
    this.address = address;
  }

  String? getName(){
    return name;
  }

  String? getAddress(){
    return address;
  }

  void setAddress(String address){
      this.address = address;
  }

  String toString(){
    return "name : $name , address : $address";
  }
}