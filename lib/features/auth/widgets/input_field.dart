import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool isPassword;

  const InputField({
    super.key,
    required this.icon,
    required this.label,
    required this.placeholder,
    required this.controller,
    this.keyboardType,
    this.isPassword = false,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFEEEEEE)),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 8),
                  child: Icon(
                    widget.icon,
                    size: 20,
                    color: const Color(0xFF7D7D7D),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    keyboardType: widget.keyboardType,
                    obscureText: widget.isPassword && !_passwordVisible,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.placeholder,
                      hintStyle: const TextStyle(
                        color: Color(0xFF999999),
                      ),
                      border: InputBorder.none,
                      suffixIcon: widget.isPassword
                          ? IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xFF7D7D7D),
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            )
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}