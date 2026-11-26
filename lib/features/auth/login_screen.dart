import 'package:flutter/material.dart';
import 'package:food/core/common/widget/app_primary_button.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/validator_functions.dart';
import 'package:food/features/auth/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.inputLabelColor,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 9),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: isPassword && _obscurePassword,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.authHeaderColor,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 12,
              color: AppColors.hintTextColor,
            ),
            filled: true,
            fillColor: AppColors.inputFieldColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 17,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(
                color: AppColors.orderButtonColor,
                width: 1.2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: AppColors.errorColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: AppColors.errorColor),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 19,
                      color: AppColors.passwordIconColor,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authHeaderColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 175,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.4,
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      'Please sign in to your existing account',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.authSubtitleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(19, 22, 19, 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildField(
                          label: 'EMAIL',
                          hint: 'example@gmail.com',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validator.validateEmail,
                        ),

                        const SizedBox(height: 20),

                        _buildField(
                          label: 'PASSWORD',
                          hint: 'Enter your password',
                          controller: _passwordController,
                          validator: Validator.validatePassword,
                          isPassword: true,
                        ),

                        const SizedBox(height: 13),

                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                value: _rememberMe,
                                activeColor: AppColors.orderButtonColor,
                                side: const BorderSide(
                                  color: AppColors.checkboxBorderColor,
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.mutedTextColor,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                debugPrint('Forgot Password');
                              },
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(
                                  color: AppColors.orderButtonColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 18),

                        SizedBox(
                          width: double.infinity,
                          child: AppPrimaryButton(
                            text: 'LOG IN',
                            onPressed: _login,
                            width: double.infinity,
                            backgroundColor: AppColors.orderButtonColor,
                            disabledBackgroundColor: AppColors.orderButtonColor,
                            foregroundColor: Colors.white,
                            textColor: Colors.white,
                            borderRadius: 10,
                            verticalPadding: 17,
                            fontSize: 13,
                            borderSide: BorderSide.none,
                          ),
                        ),

                        const SizedBox(height: 26),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF858CA0),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RegisterScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'SIGN UP',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: AppColors.orderButtonColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 22),

                        const Center(
                          child: Text(
                            'Or',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.mutedTextColor,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialButton(
                              image: 'assets/icons/facebook_icon.png',
                              name: 'Facebook',
                            ),
                            const SizedBox(width: 30),
                            _buildSocialButton(
                              image: 'assets/icons/x_icon.png',
                              name: 'X',
                            ),
                            const SizedBox(width: 30),
                            _buildSocialButton(
                              image: 'assets/icons/apple_icon.png',
                              name: 'Apple',
                            ),
                          ],
                        ),
                      ],
                    ),
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

Widget _buildSocialButton({required String image, required String name}) {
  return GestureDetector(
    onTap: () {
      debugPrint('$name clicked');
    },
    child: Image.asset(image, width: 40, height: 40, fit: BoxFit.contain),
  );
}
