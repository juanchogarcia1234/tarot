import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomProfileScreen extends StatelessWidget {
  const CustomProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProviders = [EmailAuthProvider()];
    return ProfileScreen(
      providers: authProviders,
      appBar: AppBar(title: Text('Profile')),
      actions: [
        SignedOutAction((context) {
          context.goNamed('sign-in');
        }),
      ],
    );
  }
}
