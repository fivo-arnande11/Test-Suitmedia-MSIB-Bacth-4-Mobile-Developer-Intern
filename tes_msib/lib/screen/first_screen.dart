import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:tes_msib/screen/second_screen.dart';

import '../models/profile_model.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController polindrome = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 20, 145, 138), Color.fromARGB(255, 180, 167, 167), Color.fromARGB(255, 74, 139, 76)],
              begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(32),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 65,
                    child: Icon(
                      Icons.person_add_alt_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 58.12),
                  TextField(
                    controller: name,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Name",
                      hintStyle: GoogleFonts.poppins(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 22.12),
                  SizedBox(
                    height: 78,
                    child: TextField(
                      controller: polindrome,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Polindrome",
                        hintStyle: GoogleFonts.poppins(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 45),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2B637B),
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      String _polindrome = polindrome.text;
                      String original = _polindrome;
                      String? reverse = original.split('').reversed.join('');
                      if (original == reverse) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Is Palindrome"),
                            );
                          },
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Not Palindrome"),
                              );
                            });
                      }
                    },
                    child: Text('CHECK'),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2B637B),
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Provider.of<DataUser>(context, listen: false)
                          .nameUser(name.text, " ");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(),
                        ),
                      );
                    },
                    child: Text('NEXT'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
