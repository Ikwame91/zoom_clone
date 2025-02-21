import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameTile extends StatelessWidget {
  const NameTile(
      {super.key, required this.username, required this.userEmail, this.child});
  final String username;
  final String userEmail;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: CircleAvatar(radius: 22, child: child),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: Image.asset("assets/images/google.png"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        userEmail,
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
