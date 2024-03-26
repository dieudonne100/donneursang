import 'package:donneursang/views/about/about.dart';
import 'package:donneursang/views/create_request/request_view.dart';
import 'package:donneursang/views/donation_request/donation_view.dart';
import 'package:donneursang/views/sign_pages/sign_inpage.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

//
// Donor currentUser;
class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.red),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(
                      "assets/images/logoblanc.png",
                      height: 130,
                      width: 150,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Save Lives",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  )
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  // SizedBox(height: 20,), SizedBox(height: 20,),

                  // SizedBox(height: 20,), SizedBox(height: 20,),
                  const Row(
                    children: [],
                  ),
                  ListTile(
                    title: const Text(
                      'Home',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Gotham",
                          fontSize: 18.0),
                    ),
                    leading: const Icon(
                      Icons.home,
                      color: Colors.red,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Request for Blood',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Gotham",
                          fontSize: 18.0),
                    ),
                    leading: const Icon(
                      Icons.select_all,
                      color: Colors.red,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RequestPage()));
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Blood Requests',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Gotham",
                          fontSize: 16.0),
                    ),
                    leading: const Icon(
                      Icons.remove_from_queue,
                      color: Colors.red,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DonationView()));
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Sign out',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Gotham",
                          fontSize: 16.0),
                    ),
                    leading: const Icon(
                      Icons.lock_open_sharp,
                      color: Colors.red,
                    ),
                    onTap: () async {
                      Navigator.pop(context);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()));
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'About Us',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Gotham",
                          fontSize: 16.0),
                    ),
                    leading: const Icon(
                      Icons.info,
                      color: Colors.red,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutUs()));
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
