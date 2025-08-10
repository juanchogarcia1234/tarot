import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Расклады',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment:
          //     CrossAxisAlignment.stretch, // Makes children take full width
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/deya_asana.png', width: 250),
                  Text(
                    'Deya Asana Cards',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ],
              ),
            ),
            // Space between images
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  // Navigate to the cards list screen
                  GoRouter.of(context).go('/cards');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/rider_waite_tarot.png',
                      width: 250,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rider-Waite Tarot',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/deya_tarot.png', width: 250),
                  SizedBox(height: 10),
                  Text(
                    'Deya Tarot',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
