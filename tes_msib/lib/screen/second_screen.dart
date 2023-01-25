import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:tes_msib/models/profile_model.dart';
import 'package:tes_msib/screen/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Second Screen',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 32, bottom: 32),
        child: Stack(
          children: [
            Positioned(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Consumer<DataUser>(
                      builder: (context, provider, child) {
                        return Text(
                          (provider.inputUser?.firstName.toString() ?? " ") +
                              " " +
                              (provider.inputUser?.lastName.toString() ?? ""),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Container(child: Consumer<DataUser>(
                builder: (context, value, child) {
                  return Text(
                    "${value.dataUser?.firstName.toString() ?? " Selected User Name "} ${value.dataUser?.lastName.toString() ?? ""}",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 24),
                    ),
                  );
                },
              )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B637B),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThirdScreen(),
                      ),
                    );
                  },
                  child: const Text('Choose a User'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
