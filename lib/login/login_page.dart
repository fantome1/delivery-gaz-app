import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/buttons.dart';
import '../components/forms.dart';
import '../components/textStyling.dart';
import '../constants.dart';
import '../functions.dart';
import 'authentification_page.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscur = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Connexion',
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: containerSecondColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Form(
                key: formKey,
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    const SizedBox(height: 10),
                    TextStyling.textFieldTitle("Numéro de téléphone"),
                    Forms.phoneField(phoneController),
                    const SizedBox(height: 10),
                    TextStyling.textFieldTitle("Mot de passe"),
                    SizedBox(
                      height: 50,
                      child: Forms.textField(
                        passwordController,
                        IconButton(
                            onPressed: () {
                              setState(() {
                                obscur = !obscur;
                              });
                            },
                            icon: Icon(
                                obscur
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white)),
                        obscur,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Text('Mot de passe oublié ?',
                            style: GoogleFonts.openSans(
                                color: const Color(0xFFB8B8D2), fontSize: 15)),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 30),
                    Buttons.customButton(
                      "Se connecter",
                      200,
                      () {
                        MyFunction.onChangePage(
                            context,
                            AuthentificationPage(
                                phoneNumber: phoneController.text));
                      },
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: Text('Vous n\'avez pas de compte ? ',
                          style: GoogleFonts.openSans(
                              fontSize: 14, color: const Color(0xFFB8B8D2))),
                    ),
                    TextButton(
                        child: Text("Créer un compte",
                            style: GoogleFonts.openSans(
                                color: buttonPrimaryColor, fontSize: 14)),
                        onPressed: () => MyFunction.onChangePage(
                            context, const SignUpPage())),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
