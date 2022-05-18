class Users {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Users({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> Users = new Map<String, dynamic>();
    Users['id'] = this.id;
    Users['email'] = this.email;
    Users['first_name'] = this.firstName;
    Users['last_name'] = this.lastName;
    Users['avatar'] = this.avatar;
    return Users;
  }
}
