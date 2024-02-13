class Person{
 /* int ? Id;*/
  String ? Name;
  String ? Email;
  String ? Password;
/*  String ? Address;*/
  String ? Mobile;
  Person({
    /*required this.Id,*/
    required this.Name,
    required this.Email,
    required this.Password,
    /*required this.Address,*/
    required this.Mobile
  });

  factory Person.fromMap(Map<String, dynamic> data) {
    return Person(
      /*Id: data['id'],*/
      Name: data['name'],
      Email:data['email'],
      Password:data['pass'],
      /*Address: data['con'],*/
      Mobile: data['place'],

    );
  }

  Map<String,dynamic> toMapData(){
    return {
      /*'Id': Id,*/
      'Name': Name,
      'Email': Email,
      'Password': Password,
     /* 'Address': Address,*/
      'Mobile': Mobile,
    };
  }

  @override
  String toString(){
    return 'Person{ Name: $Name, Email: $Email,Password: $Password, Mobile: $Mobile}';
  }
}