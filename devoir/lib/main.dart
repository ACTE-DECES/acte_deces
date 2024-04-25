
import 'package:devoir/Enregistrement.dart';
import 'package:devoir/DeathRegistrationPage.dart';
import 'package:devoir/home_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connectivity/connectivity.dart';
// Pour accéder au presse-papiers
import 'dart:async';

// Pour vérifier la connexion Internet

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
     
      home:
          SplashScreen(),
           // Utiliser le widget SplashScreen comme page d'accueil
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      _checkInternetConnection();
    });
  }

  void _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // Pas de connexion Internet
      _showNoConnectionDialog();
    } else {
      // Connexion Internet disponible
      _checkAuthenticationStatus();
    }
  }

  Future<void> _checkAuthenticationStatus() async {
    // Vérifier si l'utilisateur est déjà connecté
    bool? userAuthenticated =
        await checkUserAuthentication(); // Mettez votre propre logique d'authentification ici

    // Naviguer vers la page appropriée en fonction du statut de l'authentification

    if (userAuthenticated) {
      // L'utilisateur est déjà connecté, naviguer vers la page d'accueil
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // L'utilisateur n'est pas connecté, naviguer vers la page de connexion
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  const DeathRegistrationPage()),
      );
    }
  }

  Future<bool> checkUserAuthentication() async {
    // Logique pour vérifier si l'utilisateur est déjà connecté
    // Par exemple, vérifier si les informations d'authentification sont stockées localement

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // return prefs.getBool('isSuccess') ?? false;
    // Retourne true si l'utilisateur est connecté, sinon false
    return false;
  }

  void _showNoConnectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No Internet Connection'),
          content: const Text('Verifiez votre connection internet .'),
          actions: <Widget>[
            
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                _checkInternetConnection();
              },
            ),
          ],
        );
      },
    );
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    
    body: Container(
      
      color: Colors.greenAccent, // Définir la couleur du fond en vert
      child: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 40.0,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('Bienvenue'),
            ],
            isRepeatingAnimation: true,
          ),
        ),
      ),
      
    ),
  );
}
}