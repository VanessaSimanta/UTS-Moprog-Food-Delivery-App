class User {
  int? id;
  String? fname;
  String? lname;
  String? username;
  String? email;
  String? phoneNum;
  String? password;
  String? token;
  String? address;
  String? dob;


User({
  this.id,
  this.fname,
  this.lname,
  this.username,
  this.email,
  this.phoneNum,
  this.password,
  this.token,
  this.address,
  this.dob
});

factory User.fromJson(Map<String, dynamic> json){
  return User(
    id: json['user']['id'],
    fname: json['user']['fname'],
    lname: json['user']['lname'],
    username: json['user']['username'],
    email: json['user']['email'],
    phoneNum: json['user']['phoneNum'],
    password: json['user']['password'],
    address: json['user']['address'],
    dob: json['user']['dob'],
    token: json['token'],
  );
}

}