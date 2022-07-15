import 'package:flutter/material.dart';
import 'package:shop_app/presentation_layer/screens/login_screen.dart';
import 'package:shop_app/presentation_layer/screens/onbording_screen.dart';
import 'package:shop_app/presentation_layer/shared/app_router.dart';
import 'package:shop_app/presentation_layer/shared/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp( ShopApp(appRouter: AppRouter(),));
}

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
