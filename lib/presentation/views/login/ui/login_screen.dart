import 'package:clean_books/core/framework/colors.dart';
import 'package:clean_books/presentation/views/login/bloc/bloc.dart' as bloc;
import 'package:clean_books/presentation/widgets/action_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

/// This class contains the  UI Login Screen
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final blocProvider = bloc.LoginBloc()..add(bloc.InitEvent());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<bloc.LoginBloc, bloc.State>(
        bloc: blocProvider,
        builder: (context, state) {
          if (state is bloc.ValidatingUserState) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
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
              const Expanded(child: SizedBox()),
              Container(
                padding: EdgeInsets.symmetric(vertical: 100),
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    CustomFormSection(
                      hintText: "Name",
                      labelText: "Name",
                      onChanged: (String value) => blocProvider.add(
                        bloc.ChangeNameEvent(name: value),
                      ),
                    ),
                    CustomFormSection(
                      hintText: "Password",
                      labelText: "Password",
                      onChanged: (String value) => blocProvider.add(
                        bloc.ChangePasswordEvent(password: value),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    ActionButton(
                      text: 'Log in',
                      textColor: primary,
                      bgColor: buttonWhiteBackground,
                      callback: () => blocProvider.add(
                        bloc.SubmitUserEvent(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

class CustomFormSection extends StatelessWidget {
  final String hintText;
  final String labelText;
  final void Function(String) onChanged;
  const CustomFormSection(
      {required this.hintText,
      required this.labelText,
      required this.onChanged,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(color: secondary),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: secondary),
          ),
        ),
        onChanged: (String? value) {
          if (value != null) onChanged(value);
        },
        validator: (String? value) {
          return (value != null && value.isNotEmpty)
              ? 'Digite al menos un caracter'
              : null;
        },
      ),
    );
  }
}
