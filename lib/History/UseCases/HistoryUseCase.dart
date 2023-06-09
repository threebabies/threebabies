import '../Model/History.dart';

class HistoryUseCase {
  @override
  Future<List<History>> getOrderHistory() async {
    // Here you can simulate loading the order history data from the network or a local database
    return [
      History(
        productName: 'Product 1',
        quantity: 2,
        orderDate: DateTime.now(),
        status: 'Received',
        singleCost: 15.0,
        totalCost: 199.99,
        imageUrl: 'https://example.com/images/product1.jpg',
        invoiceNumber: '12345',
        otherOrderDetails: ['Detail 1', 'Detail 2', 'Detail 3'],
      ),
      History(
        productName: 'Product 2',
        quantity: 1,
        orderDate: DateTime.now(),
        status: 'Delivered',
        singleCost: 25.0,
        totalCost: 89.99,
        imageUrl: 'https://example.com/images/product2.jpg',
        invoiceNumber: '12345',
        otherOrderDetails: ['Detail 1', 'Detail 2', 'Detail 3'],
      ),
      // Add more orders as needed
    ];
  }
}