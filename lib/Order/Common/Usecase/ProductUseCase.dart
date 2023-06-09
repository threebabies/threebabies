import '../Model/Product.dart';

class ProductUseCase {
  Future<List<Product>> getProducts() async {
    // Fetch products from an API
    // Here, we'll just return some dummy data
    return [
      Product(
        title: 'Product 1',
        imageUrl: 'https://example.com/product1.jpg',
      ),
      Product(
        title: 'Product 2',
        imageUrl: 'https://example.com/product2.jpg',
      ),
      Product(
        title: 'Product 3',
        imageUrl: 'https://example.com/product3.jpg',
      ),
    ];
  }
}