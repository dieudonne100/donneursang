import 'package:flutter/material.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/logoRouge.png", height: 200, width: 200),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Thank You for Being a Donor! You are a REAL HERO!!",
                style: TextStyle(
                    color: Colors.red, fontFamily: "Gotham", fontSize: 26.0),
              ),
            ),
            MaterialButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => authScreen));
              },
              color: Colors.blueGrey,
              child: const Text(
                "Thank You",
                style: TextStyle(
                    color: Colors.red, fontFamily: "Gotham", fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
