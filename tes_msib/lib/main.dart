import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes_msib/models/profile_model.dart';
import 'package:tes_msib/screen/first_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataUser>(
      create: (context) => DataUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      ),
    );
  }
}
