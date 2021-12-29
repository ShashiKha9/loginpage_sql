class LoginCredential{
  int? id;
  String email;
  String passwd;

  LoginCredential({
     this.id,
   required this.email,
    required this.passwd,

  });
  // int get id => id;
  // String get email => email;
  // String get passwd => passwd;

  factory LoginCredential.fromJson(Map<String,dynamic> data)=> new LoginCredential(
    id: data["id"],
    email: data["email"],
    passwd: data["passwd"],
  );
  Map<String,dynamic> toJson()=>{
    "id":id,
    "email":email,
    "passwd":passwd,
  };
}