class ServiceCheckout1 {
  final String? name;
  final String? remark;
  final String? contact;
  final String? location;
  String serviceNumber;
  final String? userId;
  final String? serviceType;

  bool? isAccepted;
  bool? isAuthorised;
  bool? isDelivered;
  bool? isCancelled;
  final DateTime createdAt;
  DateTime? deliveredAt;



  ServiceCheckout1({
    required this.name,
    required this.location,
    required this.contact,
    required this.remark,
    this.serviceNumber = '',
    required this.userId,
    required this.serviceType,
      required this.createdAt,
       this.deliveredAt ,



    this.isAccepted,
    this.isAuthorised,
    this.isDelivered,
    this.isCancelled,
  });

  Map<String, dynamic> toJson() => {
        'name': name, 'location': location, 'contact': contact,
        'remark': remark,
        'serviceNumber': serviceNumber, 'serviceType': serviceType,
        'userId': userId,
        'createdAt': createdAt,

        'isAccepted': isAccepted,'isAuthorised':isAuthorised,
        'isDelivered':isDelivered,'isCancelled':isCancelled,
        'deliveredAt':deliveredAt
        //     'birthday': birthday
      };

  static ServiceCheckout1 fromJson(Map<String, dynamic> json) =>
      ServiceCheckout1(
          name: json['name'],
          location: json['location'],
          contact: json['contact'],
          serviceNumber: json['serviceNumber'],
          serviceType: json['serviceType'],
          userId: json['userId'],
          remark: json['remark'],

          isAccepted:json['isAccepted'] ,
          isAuthorised:json['isAuthorised'] ,
          isDelivered:json['isDelivered'] ,
          isCancelled:json['isCancelled'] ,
        createdAt: json['createdAt'].toDate(),
        deliveredAt: json['deliveredAt'].toDate(),

        


          );
}
