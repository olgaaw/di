class Result {
  bool? adult;
  int? gender;
  int? id;
  String? name;
  String? profilePath;

  Result({
    this.adult,
    this.gender,
    this.id,
    this.name,
    this.profilePath,
  });

  factory Result.fromJson(Map<String, dynamic> map) {
    return Result(
      adult: map['adult'] as bool?,
      gender: map['gender'] as int?,
      id: map['id'] as int?,
      name: map['name'] as String?,
      profilePath: map['profile_path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'gender': gender,
      'id': id,
      'name': name,
      'profile_path': profilePath,
    };
  }
}
