class Profile {
  Profile({
    required this.id,
    required this.name,
    required this.age,
    required this.location,
    required this.bio,
    required this.hobbies,
    required this.jobTitle,
    required this.education,
  }) : assetName = "assets/images/girl$id.jpg";

  final String id;
  final String name;
  final int age;
  final String location;
  final String bio;
  final List<String> hobbies;
  final String jobTitle;
  final String education;
  final String assetName;

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map["id"] as String,
      name: map["name"] as String,
      age: map["age"] as int,
      location: map["location"] as String,
      bio: map["bio"] as String,
      hobbies: map["hobbies"] as List<String>,
      jobTitle: map["jobTitle"] as String,
      education: map["education"] as String,
    );
  }
}
