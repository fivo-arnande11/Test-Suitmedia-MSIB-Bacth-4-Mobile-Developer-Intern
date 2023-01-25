import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tes_msib/models/profile_model.dart';
import 'package:tes_msib/models/user_model.dart';
import 'package:tes_msib/screen/second_screen.dart';
import 'package:tes_msib/view_model/user_view_model.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late Future<User> futureUser;
  List<String> numbersList = NumberGenerator().numbers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureUser = UserViewModel().getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text('Third Screen',
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w500)),
      ),
      body: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: FutureBuilder<User>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                return SizedBox(
                  child: ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Provider.of<DataUser>(context, listen: false)
                              .addUser(snapshot.data!.data![index]);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondScreen(),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                snapshot.data!.data![index].avatar.toString()),
                          ),
                          title: Text(
                            snapshot.data!.data![index].firstName.toString() +
                                ' ' +
                                snapshot.data!.data![index].lastName.toString(),
                          ),
                          subtitle: Text(
                              snapshot.data!.data![index].email.toString()),
                        ),
                      );
                    },
                  ),
                );
              }
            }
            return const Text('Something Went Wrong :(');
          },
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    List<String> freshNumbers = await NumberGenerator().slowNumbers();
    setState(() {
      numbersList = freshNumbers;
    });
  }
}

class NumberGenerator {
  Future<List<String>> slowNumbers() async {
    return Future.delayed(
      const Duration(milliseconds: 1000),
      () => numbers,
    );
  }

  List<String> get numbers => List.generate(5, (index) => number);

  String get number => Random().nextInt(99999).toString();
}
