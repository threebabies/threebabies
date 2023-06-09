import 'package:baby/History/HistoryDetail/Presentation/HistoryDetailViewController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HistoryViewModel.dart';

class HistoryViewController extends StatefulWidget {
  HistoryViewModel historyViewModel;

  HistoryViewController({required this.historyViewModel});
  @override
  _HistoryViewControllerState createState() => _HistoryViewControllerState();
}

class _HistoryViewControllerState extends State<HistoryViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => widget.historyViewModel,
        child: Center(
          child: _buildOrderHistoryList(context),
        ),
      ),
    );
  }

  Widget _buildOrderHistoryList(BuildContext context) {
    final viewModel = widget.historyViewModel;
    return FutureBuilder<void>(
      future: viewModel.loadOrderHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error loading order history');
        } else {
          return ListView.builder(
            itemCount: viewModel.orders.length,
            itemBuilder: (context, index) {
              final order = viewModel.orders[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryDetailViewController(history: viewModel.orders[index])),
                  );
                },
                child: Card(
                  child: ListTile(
                    leading: Image.network(order.imageUrl),
                    title: Text('${order.productName} (x${order.quantity})'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order Date: ${order.orderDate}'),
                        Text('Status: ${order.status}'),
                        Text('Total Cost: \$${order.totalCost.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}