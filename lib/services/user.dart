class User {
  late final String email;
  late final bool userState;


  User.fromJson(Map<String, dynamic> json, this.userState){
    email = json['email'];
    userState = json['userState'];
  }

  @override
  String toString() {
    return 'User{email: $email, userState: $userState}';
  }
}