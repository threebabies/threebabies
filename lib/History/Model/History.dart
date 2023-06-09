import 'dart:ui';

import 'package:flutter/material.dart';

class History {
  final String productName;
  final String invoiceNumber;
  final int quantity;
  final DateTime orderDate;
  final String status;
  final double singleCost;
  final double totalCost;
  final List<String> otherOrderDetails;
  final String imageUrl;

  History({
    required this.productName,
    required this.invoiceNumber,
    required this.quantity,
    required this.orderDate,
    required this.status,
    required this.singleCost,
    required this.totalCost,
    required this.otherOrderDetails,
    required this.imageUrl
  });

  Color getStatusColor() {
    if (status == 'received') {
      return Colors.green;
    } else if (status == 'in progress') {
      return Colors.yellow;
    } else {
      return Colors.grey;
    }
  }
}