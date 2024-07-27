class Response {
  late final  String token;
  late final  String message;

  Response({ required this.token,  required this.message});

  Response.fromJson(Map<String, dynamic> json){
    token = json['userState'];
    message = json['email'];
  }

}



