// Create a sign ing stateless widget

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSignInScreen extends StatelessWidget {
  const CustomSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProviders = [EmailAuthProvider()];
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SignInScreen(
          headerBuilder: (context, constraints, shrinkOffset) => Text('asaf'),
          providers: authProviders,
          actions: [
            AuthStateChangeAction<SignedIn>((context, state) {
              context.goNamed('/');
            }),
          ],
        ),
      ),
    );
  }
}
