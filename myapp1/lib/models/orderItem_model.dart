class CartItem {
  final String? clientName;

  final String? contact;
  final String? contact1;
  final String? location;
  final products;

  String orderItemId;
  final String? clientUid;

  bool? isPaid;

  final DateTime createdAt;

  bool? isApproved;
  DateTime? approvedDate;

  bool? isAssigned;
  DateTime? assignedDate;

  bool? isProcessed;
  DateTime? processedDate;

  bool? isCompleted;
  DateTime? completedDate;

  bool? isDelivered;
  DateTime? deliveredDate;

  double totalCost;

  // Map<String, dynamic> orderinfo;
  List orderItems;

  CartItem(
      {required this.clientName,
      required this.location,
      required this.contact1,
      required this.contact,
      this.products,
      this.orderItemId = '',
      required this.clientUid,
      this.isApproved,
      this.approvedDate,
      this.isAssigned,
      this.assignedDate,
      this.isProcessed,
      this.processedDate,
      this.isCompleted,
      this.completedDate,
      required this.createdAt,
      this.isDelivered,
      this.deliveredDate,
      required this.orderItems,
      required this.totalCost,
      this.isPaid 

      
      });

  Map<String, dynamic> toJson() => {
        'clientName': clientName,
        'location': location,
        'contact': contact,
        'contact1': contact1,
        'orderItemId': orderItemId,
        'clientUid': clientUid,
        'products': products,
        'isApproved': isApproved,
        'isAssigned': isAssigned,
        'isProcessed': isProcessed,
        'createdAt': createdAt,
        'isCompleted': isCompleted,
        'isDelivered': isDelivered,
        'orderItems': orderItems,
        'approvedDate': approvedDate,
        'assignedDate': assignedDate,
        'processedDate': processedDate,
        'completedDate': completedDate,
        'deliveredDate': deliveredDate,
        'totalCost':totalCost,
        'isPaid':isPaid
      };

  static CartItem fromJson(Map<String, dynamic> json) => CartItem(
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
      orderItems: json['orderItems'],
      totalCost: json['totalCost'],

      isPaid: json['isPaid'],

      createdAt: json['createdAt'].toDate(),
      approvedDate: json['approvedDate'].toDate(),
      assignedDate: json['assignedDate'].toDate(),
      processedDate: json['processedDate'].toDate(),
      completedDate: json['completedDate'].toDate(),
      deliveredDate: json['deliveredDate'].toDate());
}
