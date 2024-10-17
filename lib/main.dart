import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone_101/authentication/auth_method.dart';
import 'package:zoom_clone_101/firebase_options.dart';
import 'package:zoom_clone_101/screens/homescreen.dart';
import 'package:zoom_clone_101/screens/login_screen.dart';
import 'package:zoom_clone_101/screens/meeting_screen.dart';
import 'package:zoom_clone_101/screens/video_call_screen.dart';
import 'package:zoom_clone_101/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
try{
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform, 
     
  );
    runApp(const MyApp());
} catch(e){
  print('Error initializing app: $e'); 

}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const Homescreen(),
        '/meeting': (context) =>  MeetingScreen(),
        '/video-call': (context) => VideoCallScreen(),

      },
         home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return const Homescreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
