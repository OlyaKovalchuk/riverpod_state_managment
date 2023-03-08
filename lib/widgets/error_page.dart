import 'package:auth_riverpod/pages/auth/auth_page.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Column(
                children: const [
                  Icon(
                    Icons.error,
                    size: 30,
                    color: Colors.red,
                  ),
                  SizedBox(height: 20),
                  Text("It's an error page"),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => onPressed(context),
                child: const Text('Go to Login page'),
              ),
              //  const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void onPressed(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const AuthPage(),
      ),
      (route) => false,
    );
  }
}
