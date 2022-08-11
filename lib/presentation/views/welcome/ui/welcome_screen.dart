import 'package:clean_books/core/framework/colors.dart';
import 'package:clean_books/core/framework/routes.dart';
import 'package:clean_books/core/router_manager.dart';
import 'package:clean_books/presentation/views/welcome/bloc/bloc.dart';
import 'package:clean_books/presentation/widgets/action_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget implements WelcomeBlocDelegate {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        constraints:
            BoxConstraints(minHeight: size.height, minWidth: size.width),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/950/public/media/image/2019/09/witcher.jpg?itok=Na5WmRE1'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Text(
              'Welcome!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 300,
            ),
            ActionButton(
              text: 'Sign up',
              bgColor: buttonYellowBackground,
            ),
            const SizedBox(
              height: 30,
            ),
            ActionButton(
              text: 'Log in',
              textColor: primary,
              bgColor: buttonWhiteBackground,
              callback: () => routeManager.navigateRoute(
                  name: kLoginRoute, context: context),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 16,
                color: buttonWhiteBackground,
                decoration: TextDecoration.underline,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Future<void> showLoginDialog(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25),
              topRight: const Radius.circular(25)),
        ),
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            height: MediaQuery.of(context).size.height * 0.95,
            child: ChangeFlowBottonSheetScreen(
              selectFlow: widget.viewModel.reloadMenu,
              requiredShowSelection: !enableDrag,
            ),
          );
        });
  }
}
