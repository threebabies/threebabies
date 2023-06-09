// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../Presentation/SettingViewController.dart';
// import '../Presentation/SettingViewModel.dart';
//
// class SettingsPageView extends StatelessWidget {
//   final SettingsViewModel viewModel;
//
//   SettingsPageView({required this.viewModel});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<SettingsViewModel>.value(
//       value: viewModel,
//       child: Consumer<SettingsViewModel>(
//         builder: (context, viewModel, _) {
//           return SettingViewController(
//             isDarkMode: viewModel.isDarkMode,
//             selectedLanguage: viewModel.selectedLanguage,
//             toggleDarkMode: viewModel.toggleDarkMode,
//             changeLanguage: viewModel.changeLanguage,
//           );
//         },
//       ),
//     );
//   }
// }