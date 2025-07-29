import 'package:auralys/features/auth/widgets/back_button.dart';
import 'package:auralys/features/auth/widgets/forgot_password_card.dart';
import 'package:auralys/features/auth/widgets/forgot_password_popup.dart';
import 'package:auralys/features/auth/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordOption {
  final String title;
  final String description;
  final IconData icon;

  ForgotPasswordOption(this.title, this.description, this.icon);
}

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int selectedIndex = 1;

  final List<ForgotPasswordOption> options = [
    ForgotPasswordOption(
      'SMS Recovery',
      'Reset password via SMS to your registered phone number',
      Icons.sms_outlined,
    ),
    ForgotPasswordOption(
      'Email Recovery',
      'Reset password via email to your registered email address',
      Icons.email_outlined,
    ),
    ForgotPasswordOption(
      'Security Questions',
      'Answer your security questions to reset your password',
      Icons.help_outline,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const CustomBackButton(),
              const SizedBox(height: 32),
              
              const Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF333333),
                ),
              ),
              
              const SizedBox(height: 16),
              
              const Text(
                'Select which contact details should we use to reset your password',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF666666),
                  height: 1.4,
                ),
              ),
              
              const SizedBox(height: 32),
              
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: ForgotPasswordCard(
                          icon: options[index].icon,
                          title: options[index].title,
                          selected: selectedIndex == index,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: PrimaryButton(
            text: 'Send Reset Link',
            onPressed: _handleSendResetLink,
            margin: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }

  void _handleSendResetLink() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const ForgotPasswordPopup();
      },
    );
  }
}
