import 'package:expense_tracker/screens/app.dart';
import 'package:expense_tracker/widgets/button.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF8FAFF), 
              Color(0xFFE3EBFF),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),

                Image.asset(
                  'assets/logo.png',
                  height: 120,
                ),

                const SizedBox(height: 32),

                Text(
                  'Track Your Spending Effortlessly',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: 12),

                Text(
                  'Manage your finances easily using our intuitive and friendly interface',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  child: Button(
                    title: 'Get Started',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const App())
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                  },
                  child: const Text(
                    'Already have an account? Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

