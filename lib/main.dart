// main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pertemuan8/firebase_options.dart';
import 'package:pertemuan8/screens/auth_middleware.dart';
import 'package:pertemuan8/screens/custom_page_transition.dart';
import 'package:pertemuan8/screens/splash_screen.dart';
import 'package:pertemuan8/screens/add_product_screen.dart';
import 'package:pertemuan8/screens/edit_product_screen.dart';
import 'package:pertemuan8/screens/home_screen.dart';
import 'package:pertemuan8/screens/login_page.dart';
import 'package:pertemuan8/screens/register_page.dart';
import 'package:pertemuan8/services/service_product.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductService>(create: (_) => ProductService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) =>
              const AuthMiddleware(child: HomeScreen()), // Use middleware
          '/addProduct': (context) =>
              AuthMiddleware(child: AddProductScreen()), // Use middleware
          '/login': (context) => const LoginPage(),
          '/register': (context) => const registerPage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/editProduct') {
            final args = settings.arguments as Map<String, dynamic>;
            return CustomPageTransition(
              child: AuthMiddleware(
                child: EditProductScreen(
                  productId: args['productId'],
                ),
              ),
            );
          }
          assert(false, 'Need to implement ${settings.name}');
          return null;
        },
      ),
    );
  }
}
