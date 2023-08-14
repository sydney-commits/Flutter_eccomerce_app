class UserProfile {
  final String? fname;
  final String? lname;
  final String? contact;
  final String? location;
  final String? email;

  String userId;
  String userUid;
  final String? role;

  UserProfile({
    required this.fname,
    required this.lname,
    required this.location,
    required this.contact,
    required this.email,
    this.userId = '',
    this.userUid = '',
    required this.role
  });

  Map<String, dynamic> toJson() => {
        'fname': fname, 'lname': lname, 'location': location,
        'contact': contact,
        'email': email,
        'userUid': userUid,
        'userId': userId,
        'role':role

        //     'birthday': birthday
      };

  static UserProfile fromJson(Map<String, dynamic> json) => UserProfile(
        fname: json['fname'],
        lname: json['lname'],
        location: json['location'],
        contact: json['contact'],
        userUid: json['serviceNumber'],
        email: json['email'],
        userId: json['userId'],
        role:json['role']
      );
}
