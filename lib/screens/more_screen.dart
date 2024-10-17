import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_clone_101/authentication/auth_method.dart';
import 'package:zoom_clone_101/utils/colors.dart';
import 'package:zoom_clone_101/widgets/custom_tile.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final AuthMethods authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    final currentUser = authMethods.currentUser;
        String? email = currentUser.email ?? 'No email';
    String? displayName = currentUser.displayName ?? 'No display name';
    String? photoURL = currentUser.photoURL;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'More',
          style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      body:  Column(
        children: [
          CustomTile(
            userEmail: email,
            username: displayName,
            child: photoURL != null
                ? Image.network(photoURL)
                : const Icon(Icons.person, size: 44), // Placeholder if no photo
          ),
        ],
      ),
    );
  }
}
