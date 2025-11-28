// ignore_for_file: public_member_api_docs, sort_constructors_first

class Signupmodel {
  String? email;
  String? id;
  String? name;
  Signupmodel({
    this.email,
    this.id,
    this.name,
  });

  Signupmodel copyWith({
    String? email,
    String? password,
    String? name,
  }) {
    return Signupmodel(
      email: email ?? this.email,
      id: password ?? id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'id': id,
      'name': name,
    };
  }

  factory Signupmodel.fromMap(Map<String, dynamic> map) {
    return Signupmodel(
      email: map['email'] != null ? map['email'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

}