class UserModel {
  String? uuid;
  String? email;
  String? firstName;
  String? secondName;

  UserModel({this.uuid, this.email, this.firstName, this.secondName});

  factory UserModel.fromMap(map) {
    return new UserModel(
        uuid: map['uuid'],
        email: map['email'],
        firstName: map['firstName'],
        secondName: map['secondName']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid':uuid,
      'email':email,
      'firstName':firstName,
      'secondName':secondName,
    };
  }
}
