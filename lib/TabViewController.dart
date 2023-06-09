import 'package:baby/History/Presentation/HistoryViewModel.dart';
import 'package:baby/Order/OrderForm/Product/Presentation/ProductViewController.dart';
import 'package:baby/Order/OrderForm/Product/Presentation/ProductViewModel.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import 'Account/Presentation/SettingViewController.dart';
import 'History/Presentation/HistoryViewController.dart';
import 'History/UseCases/HistoryUseCase.dart';
import 'Order/Common/Usecase/ProductUseCase.dart';

class TabViewController extends StatefulWidget {
  @override
  _TabViewControllerState createState() => _TabViewControllerState();
}

class _TabViewControllerState extends State<TabViewController> {
  int _selectedIndex = 0;

  late List<BottomNavigationBarItem> _pages;
  late List<Widget> _viewControllers;

  @override
  Widget build(BuildContext context) {
    _pages = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: const Icon(Icons.shopping_cart), label: 'Products'.i18n()),
      BottomNavigationBarItem(icon: const Icon(Icons.history), label: 'History'.i18n()),
      BottomNavigationBarItem(icon: const Icon(Icons.settings), label: 'Settings'.i18n()),
    ];
    ProductViewModel productViewModel = ProductViewModel(productUseCase: ProductUseCase());
    HistoryViewModel historyViewModel = HistoryViewModel(historyUseCase: HistoryUseCase());
    _viewControllers = [
      ProductViewController(productViewModel: productViewModel),
      HistoryViewController(historyViewModel: historyViewModel),
      SettingViewController()
    ];
    return Scaffold(
      body: _viewControllers[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _pages,
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  TabController get _tabController {
    return DefaultTabController.of(context)!;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}