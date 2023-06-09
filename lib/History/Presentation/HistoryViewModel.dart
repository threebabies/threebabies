import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Model/History.dart';
import '../UseCases/HistoryUseCase.dart';

class HistoryViewModel extends ChangeNotifier {
  final HistoryUseCase historyUseCase;

  List<History> _histories = [];
  List<History> get orders => _histories;

  HistoryViewModel({required this.historyUseCase});

  Future<void> loadOrderHistory() async {
    _histories = await historyUseCase.getOrderHistory();
    notifyListeners();
  }
}