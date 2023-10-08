class User {
  late int id;
  bool following = false;
  late String first_name;
  late String last_name;
  late String username;
  late String email;
  late String avatar;
  late String phone_number;
  late String date_of_birth;
  late Address address;

  User.fromJson(Map<String,dynamic> json){
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    username= json['username'];
    email = json['email'];
    avatar = json['avatar'];
    phone_number = json['phone_number'];
    date_of_birth = json['date_of_birth'];
    address = Address.fromJson(json['address']);

  }

}

class Address {
  late String city;
  late String street_name;
  Address.fromJson(Map<String,dynamic> json){
    city = json['city'];
    street_name = json['street_name'];
  }
}