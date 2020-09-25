import 'package:flutter/material.dart';
import 'package:flutter_app/models/Cart.dart';
import 'package:flutter_app/models/Product.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApplication());

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(
          create: (context) => ProductDataProvider(),
        ),
        ChangeNotifierProvider<CartDataProvider>(
          create: (context) => CartDataProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Demo App',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          backgroundColor: Colors.white,
          textTheme: GoogleFonts.marmeladTextTheme(Theme.of(context).textTheme),
        ),
        home: HomePage(),
      ),
    );
  }
}
