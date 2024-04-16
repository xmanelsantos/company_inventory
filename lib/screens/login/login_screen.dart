import 'package:company_inventory/routes.dart';
import 'package:company_inventory/screens/home/home_screen.dart';
import 'package:company_inventory/utils/firebase_utils.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:seafarer/seafarer.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: FirebaseUtils.loginProviders,
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          Routes.seafarer.navigate(
            HomeScreen.routeName,
            navigationType: NavigationType.popAndPushNamed,
          );
        }),
      ],
    );
  }
}
