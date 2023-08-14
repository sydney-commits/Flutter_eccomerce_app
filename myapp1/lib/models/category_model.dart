import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String fname;
  final String lname;

  final String contact;
  final String location;
  final String email;

  String serviceId;
  // final String imageUrl;
  String serviceUid;

  bool? isActive;

  bool? isApproved;

  String? role;
  String? servicetype;

  String businessCode;
  String businessname;
  String description;

  final DateTime createdAt;

  final String imageUrl;


  Category(
      {
         required this.fname,
    required this.lname,
    required this.location,
    required this.contact,
    required this.email,
    this.serviceId = '',
    this.serviceUid = '',
    this.isActive,
    this.isApproved,
    this.role,
    this.servicetype,
    this.businessname = '',
    this.description = '',
    this.businessCode = '',
    required this.createdAt,
    required this .imageUrl
      
      });

  @override
  List<Object?> get props {
    return [
       fname, 
        lname,
         location,
       contact,
        email,
       serviceUid,
         serviceId,
        isActive,
         isApproved,
         servicetype,
         role,
         businessname,
         description,
         businessCode,
        createdAt,
        imageUrl

    ];
  }

  Category copyWith({
    String? fname,
    String? lname,
       String? contact,
    String? location,
    String? email,
    String? serviceUid,
     String? serviceId,
       bool? isApproved,
    bool? isActive,

      String? role,
  String? servicetype,

  String? businessCode,
  String? businessname,
  String? description,

   DateTime? createdAt,
   String? imageUrl


   
  }) {
    return Category(
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      contact: contact ?? this.contact,
      location: location ?? this.location,
      email: email ?? this.email,
      serviceId: serviceId ?? this.serviceId,
      serviceUid: serviceUid ?? this.serviceUid,
      isActive: isActive ?? this.isActive,
       isApproved: isApproved ?? this.isApproved,
       role: role ?? this.role,
       servicetype: servicetype ?? this.servicetype,

       businessname: businessname ?? this.businessname,
      description: description ?? this.description,
       businessCode: businessCode ?? this.businessCode,
      
      imageUrl: imageUrl ?? this.imageUrl,
 
      createdAt: createdAt ?? this.createdAt,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fname": fname,
      "lname": lname,
           "contact": contact,
      "location": location,
      "email": email,
      "serviceId": serviceId,
      "serviceUid": serviceUid,
      "isApproved": isApproved,
      "isActive": isActive,
      "role": role,
      "servicetype": servicetype,
      "businessname": businessname,
      "description": description,
      "businessCode": businessCode,
      
      "imageUrl": imageUrl,
 

      
      "createdAt":createdAt
    };
  }

  static Category fromJson(Map<String, dynamic> json) => Category(
        fname: json['fname'],
        lname: json['lname'],
         contact: json['contact'],
         location: json['location'],
         email: json['email'],
         serviceId: json['serviceId'],
         serviceUid: json['serviceUid'],
         isApproved: json['isApproved'],
        isActive: json['isActive'],
        role: json['role'],
        servicetype: json['servicetype'],
        businessCode: json['businessCode'],
        businessname: json['businessname'],

        description: json['description'],
       
        
        imageUrl: json['imageUrl'],

        
        createdAt: json['createdAt']
      );

  factory Category.fromSnapshot(DocumentSnapshot snap) {
    return Category(
        fname: snap['fname'],
        lname: snap['lname'],
       contact: snap['contact'],
        location: snap['location'],
        email: snap['email'],
        serviceId: snap['serviceId'],
         serviceUid: snap['serviceUid'],
          isApproved: snap['isApproved'],
        isActive: snap['isActive'],
        role: snap['role'],
        servicetype: snap['servicetype'],
        businessname: snap['businessname'],

        description: snap['description'],
        businessCode: snap['businessCode'],
      
        imageUrl: snap['imageUrl'],   
        createdAt: snap['createdAt'].toDate(),

        );
  }
}


// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:equatable/equatable.dart';

// class Category extends Equatable {
//   final String name;
//   final String description;

//   String serviceId;
//   final String imageUrl;

//   final String contact;
//   final String location;

//   final String serviceUid;
//   final String businessCode;

//   final bool isApproved;
//   final bool isActive;

//   final bool isService;

//   Category({
//     required this.name,
//     required this.description,
//     this.serviceId = '',
//     required this.imageUrl,
//     required this.contact,
//     required this.location,
//     required this.serviceUid,
//     required this.isApproved,
//     required this.isActive,
//     required this.isService,
//     required this.businessCode
//   });

//   @override
//   List<Object?> get props {
//     return [
//       name,
//       description,
//       serviceId,
//       imageUrl,
//       contact,
//       location,
//       serviceUid,
//       isApproved,
//       isActive,
//       isService,
//       businessCode
//     ];
//   }

//   Category copyWith({
//     String? name,
//     String? description,
//     String? serviceId,
//     String? imageUrl,
//     String? contact,
//     String? location,
//     String? serviceUid,
//     String? businessCode,
//     bool? isService,
//     bool? isApproved,
//     bool? isActive,
//   }) {
//     return Category(
//       name: name ?? this.name,
//       description: description ?? this.description,
//       serviceId: serviceId ?? this.serviceId,
//       imageUrl: imageUrl ?? this.imageUrl,
//       contact: contact ?? this.contact,
//       location: location ?? this.location,
//       serviceUid: serviceUid ?? this.serviceUid,
//       isApproved: isApproved ?? this.isApproved,
//       isActive: isActive ?? this.isActive,
//       isService: isService ?? this.isService,

//       businessCode: businessCode ?? this.businessCode,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "name": name,
//       "description": description,
//       "serviceId": serviceId,
//       "imageUrl": imageUrl,
//       "contact": contact,
//       "location": location,
//       "serviceUid": serviceUid,
//       "isApproved": isApproved,
//       "isActive": isActive,
//       "isService": isService,
//       "businessCode":businessCode
//     };
//   }

//   static Category fromJson(Map<String, dynamic> json) => Category(
//         name: json['name'],
//         description: json['description'],
//         contact: json['contact'],
//         serviceId: json['serviceId'],
//         imageUrl: json['imageUrl'],
//         location: json['location'],
//         serviceUid: json['serviceUid'],
//         isApproved: json['isApproved'],
//         isActive: json['isActive'],
//         isService: json['isService'],
//         businessCode: json['businessCode'],

        
//       );

//   factory Category.fromSnapshot(DocumentSnapshot snap) {
//     return Category(
//         name: snap['name'],
//         description: snap['description'],
//         serviceId: snap['serviceId'],
//         imageUrl: snap['imageUrl'],
//         contact: snap['contact'],
//         location: snap['location'],
//         serviceUid: snap['serviceUid'],
//         isApproved: snap['isApproved'],
//         isActive: snap['isActive'],
//         isService: snap['isService'],
//         businessCode:snap['businessCode']
//         );

//   }


// }

