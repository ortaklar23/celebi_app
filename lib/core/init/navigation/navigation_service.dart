import 'package:celebi_app/core/init/navigation/INavigationService.dart';
import 'package:flutter/material.dart';

class NavigationService implements INavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? data}) async {
    // geride kalan tüm sayfaları siler.
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }
}
