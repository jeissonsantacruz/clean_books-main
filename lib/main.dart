import 'package:clean_books/core/router_manager.dart';
import 'package:clean_books/presentation/views/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(fontFamily: 'Gilroy'),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      onGenerateRoute: routeManager.generateRouted,
    );
  }
}
