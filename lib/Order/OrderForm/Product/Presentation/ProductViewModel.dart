import 'dart:async';

import 'package:flutter/material.dart';

import '../../../Common/Model/Product.dart';
import '../../../Common/Usecase/ProductUseCase.dart';


class ProductViewModel extends ChangeNotifier {
  final ProductUseCase productUseCase;

  ProductViewModel({required this.productUseCase});

  List<Product> _products = [];
  bool _isLoading = false;
  late String _errorMessage = "";

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> loadProducts() async {
    try {
      _isLoading = true;
      final products = await productUseCase.getProducts();
      _products = products;
      _errorMessage = "";
    } catch (e) {
      _errorMessage = 'Failed to load products: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}