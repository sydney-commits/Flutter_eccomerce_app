class OrderItem {
  final String? clientName;

  final String? contact;
  final String? contact1;
  final String? location;
  final products;

  String orderItemId;
  final String? clientUid;

  bool? isPaid;
  bool? isApproved;
  bool? isAssigned;
  bool? isProcessed;

  bool? isOntransit;
  bool? isDelivered;
 

  OrderItem({
    required this.clientName,
    required this.location,
    required this.contact1,
    required this.contact,
    this.products,
    
    this.orderItemId ='',
    required this.clientUid,
    this.isApproved,
    this.isAssigned,
    this.isProcessed,
    this.isOntransit,
    this.isDelivered,

  });

  Map<String, dynamic> toJson() => {
        'clientName': clientName, 'location': location, 'contact': contact,
        'contact1': contact1,
        'products':products,
        'orderItemId': orderItemId, 'clientUid': clientUid,
        'isApproved': isApproved,
        'isAssigned': isAssigned, 'isProcessed': isProcessed,
        'isOntransit': isOntransit, 'isDelivered': isDelivered,
        //     'birthday': birthday
      };

  static OrderItem fromJson(Map<String, dynamic> json) => OrderItem(
        clientName: json['clientName'],
        location: json['location'],
        contact: json['contact'],
        contact1: json['contact1'],
        orderItemId: json['orderItemId'],
        clientUid: json['clientUid'],
        isApproved: json['isApproved'],
        isAssigned: json['isAssigned'],
        isProcessed: json['isProcessed'],
        isDelivered: json['isDelivered'],
       


        

         products: json['products'],
      
      );
}
