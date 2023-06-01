import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/buttons.dart';
import '../components/forms.dart';
import '../components/textStyling.dart';
import '../constants.dart';
import '../functions.dart';
import 'authentification_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController civilController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController forenameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  bool obscur = false, policyChecked = false;

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
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("S'inscrire",
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: Text('Entrez vos informations pour vous inscrire',
                    style: GoogleFonts.openSans(
                        color: Colors.white, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: const BoxDecoration(
                    color: containerSecondColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Form(
                    key: formKey,
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        TextStyling.textFieldTitle(
                            "Numéro d'identité(CNIB, Passport, etc.)"),
                        Forms.textField(idController),
                        const SizedBox(height: 10),
                        TextStyling.textFieldTitle("Nom"),
                        Forms.textField(nameController),
                        const SizedBox(height: 10),
                        TextStyling.textFieldTitle("Prénom"),
                        Forms.textField(forenameController),
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
                        const SizedBox(height: 10),
                        TextStyling.textFieldTitle("Confirmer Mot de passe"),
                        SizedBox(
                          height: 50,
                          child: Forms.textField(
                            confirmController,
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
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              value: policyChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  policyChecked = value!;
                                });
                              },
                            ),
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                    style: GoogleFonts.openSans(
                                      color: const Color(0xFF858597),
                                      fontSize: 15,
                                    ),
                                    children: [
                                      const TextSpan(
                                          text:
                                              'En créant votre compte, vous acceptez nos '),
                                      TextSpan(
                                        text: 'conditions d\'utilisation ',
                                        style: GoogleFonts.openSans(
                                            color: buttonPrimaryColor),
                                      ),
                                      const TextSpan(
                                          text:
                                              'et êtes d\'accord avec notre '),
                                      TextSpan(
                                        text: 'politique de confidentialité',
                                        style: GoogleFonts.openSans(
                                            color: buttonPrimaryColor),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Buttons.customButton(
                          "Créer un compte",
                          200,
                          () async {
                            if (policyChecked) {
                              MyFunction.onChangePage(
                                  context,
                                  AuthentificationPage(
                                      phoneNumber: phoneController.text));
                            }
                          },
                          policyChecked ? true : false,
                        ),
                      ],
                    ),
                  )),
            ],
          )),
    );
  }
}
