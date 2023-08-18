void main(){

  final emails = [
    'ahmed@gmail.com',
    'sara@yahoo.com',
    'abc@zoo.com',
    'adees@roro.coooom',
    'magdy@gmail.com',
    'abc@9o.com',
  ];

  final vaildDomain = ['gmail.com', 'yahoo.com'];

  final allDomain = emails.map((email) => email.split('@').last).toList();
  print(allDomain);

  final notValidDomain = allDomain.where((domain) => !vaildDomain.contains(domain));
  print(notValidDomain);



  



  









}


