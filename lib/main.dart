import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thence_mechine_test/view/Details_screen/Details_screen.dart';
import 'package:thence_mechine_test/view/Home_screen/screens/Home_screen.dart';
import 'package:uni_links2/uni_links.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    // Initialize the deep link listener
    _initDeepLinkListener();
  }

  @override
  void dispose() {
    // Cancel the subscription to avoid memory leaks
    _sub?.cancel();
    super.dispose();
  }

  void _initDeepLinkListener() {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null && mounted) {
        // Handle the deep link here
        String? productId =
            uri.pathSegments.isNotEmpty ? uri.pathSegments.last : null;

        if (productId != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(productId: productId),
            ),
          );
        }
      }
    }, onError: (Object err) {
      // Handle errors
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomescreenWrapper(),
    );
  }
}
