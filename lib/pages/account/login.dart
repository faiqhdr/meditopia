import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/bottom_bar.dart';
import '../../style/style.dart';
import 'register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void _navigateToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BottomBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(right: 25, left: 25, top: 153, bottom: 0),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff3671a4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 55),
              width: 140,
              height: 110,
              child: Image.asset(
                AppStyle.appFullLogo,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 1, bottom: 1),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.18,
                        color: Color(0xff0e1012),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 1, bottom: 1),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.18,
                        color: Color(0xff0e1012),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 0),
              width: double.infinity,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xffe09f1f),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextButton(
                onPressed: () => _navigateToHome(context),
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.18,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 8, left: 8),
              child: TextButton(
                onPressed: () => _navigateToSignUp(context),
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Color(0xffffffff),
                      decorationColor: Color(0xffffffff),
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.18,
                          color: Color(0xffffffff),
                          decorationColor: Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
