class AppUser {
  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.gender,
    required this.interest,
    required this.birthday,
  });
  final String id;
  final String name;
  final String email;
  final String token;
  final String gender;
  final String interest;
  final DateTime birthday;

  factory AppUser.fromJson(Map<String, dynamic> json) {
    final rawBirthday = json['user']['birthday'] as String;
    // ! Might throw error if backend data not compatible
    // ! Need more error handling
    final birthday = DateTime.parse(rawBirthday);
    return AppUser(
      id: json['user']['id'] as String,
      name: json['user']['name'] as String,
      email: json['user']['email'] as String,
      token: json['token'] as String,
      gender: json['user']['gender'] as String,
      interest: json['user']['interest'] as String,
      birthday: birthday,
    );
  }

  Map<String, dynamic> toJson() => {
        'user': {
          'id': id,
          'name': name,
          'email': email,
          'gender': gender,
          'interest': interest,
          'birthday': birthday.toString()
        },
        'token': token,
      };

  @override
  String toString() {
    return 'AppUser(id:$id, name:$name, email:$email, gender:$gender, interest:$interest, birthday:$birthday)';
  }
}
