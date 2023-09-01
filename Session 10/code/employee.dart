class Employee{

int?id;
String?firstname;
String? lastname;
int?_salary;

Employee(int id , String firstname, String lastname, int salary){
  this.id = id;
  this.firstname = firstname;
  this.lastname = lastname;
  this._salary = salary;
}

void setSalary(int salary){

if(salary <= 0){
  print('Invalid Salary');

}
else{
  this._salary = salary;
}
}

}