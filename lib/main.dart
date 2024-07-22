import 'package:flutter/material.dart';
import 'package:history_trade/src/components/navbar_view/navbar_view.dart';
import 'package:history_trade/src/models/user/user_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CreateUserModel()),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Solway',
            ),
            // home: const NavbarView(),
            home: const NavbarView(),
          );
        },
      ),
    );
  }
}
