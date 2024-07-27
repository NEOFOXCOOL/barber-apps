class Response {
  late final String email;
  late final String userState;

  Response({required this.email, required this.userState});

  Response.fromJson(Map<String, dynamic> json, this.email, this.userState){
    userState = json['userState'];
    email = json['email'];
  }

}


