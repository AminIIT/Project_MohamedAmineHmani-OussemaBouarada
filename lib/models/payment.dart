import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentsModel {
  static const ID = "id";
  static const PAYMENT_ID = "paymentId";
  static const CART = "cart";
  static const AMOUNT = "amount";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  late String id;
  late String paymentId;
  late String amount;
  late String status;
  late int createdAt;
  late List cart;
  PaymentsModel({
    required this.id,
    required this.paymentId,
    required this.amount,
    required this.status,
    required this.createdAt,
    required this.cart,
  });

  PaymentsModel.fromMap(Map data) {
    id = data[ID];
    createdAt = data[CREATED_AT];
    paymentId = data[PAYMENT_ID];
    amount = data[AMOUNT];
    status = data[STATUS];
    cart = data[CART];
  }
  factory PaymentsModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    return PaymentsModel(
      id: documentSnapshot.id,
      createdAt: documentSnapshot[CREATED_AT],
      paymentId: documentSnapshot[PAYMENT_ID],
      amount: documentSnapshot[AMOUNT],
      status: documentSnapshot[STATUS],
      cart: documentSnapshot[CART],
    );
  }
}
