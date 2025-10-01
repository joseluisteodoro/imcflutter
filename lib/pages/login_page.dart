import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imcflutter/pages/Home_page.dart';
import 'package:imcflutter/shared/widgets/appcolors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.greenmedium,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text("Calculadora IMC",
                style: GoogleFonts.comicNeue(fontSize: 30,
                
                fontWeight: FontWeight.bold)
                ),
              SizedBox(height: 50,),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Appcolors.bluemedium,
                  foregroundColor: Appcolors.greenlight,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PaginaInicial()));
                },
                child: Text("Entrar"),)
            ],
          ),
        )),
    );
  }
}