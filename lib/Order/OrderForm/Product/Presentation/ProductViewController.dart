import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Common/Usecase/ProductUseCase.dart';
import '../View/ProductListView.dart';
import 'ProductViewModel.dart';
class ProductViewController extends StatefulWidget {
  ProductViewModel productViewModel;

  ProductViewController({required this.productViewModel});
  @override
  _ProductViewControllerState createState() => _ProductViewControllerState();
}

class _ProductViewControllerState extends State<ProductViewController> {

  @override
  Widget build(BuildContext context) {
    widget.productViewModel.loadProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('Three babies'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => widget.productViewModel,
        child: Consumer<ProductViewModel>(
          builder: (context, viewModel, _) {
            if (viewModel.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (viewModel.errorMessage != "") {
              return Center(child: Text(viewModel.errorMessage));
            } else {
              return ProductListView(
                products: viewModel.products,
                onProductTapped: (product) {
                  // Navigate to the product detail page
                }
              );
            }
          },
        ),
      ),
    );
  }
}