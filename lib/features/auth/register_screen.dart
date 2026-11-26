import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/common/widget/app_primary_button.dart';
import 'package:food/core/utils/validator_functions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Widget _buildField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    bool obscurePassword = false,
    VoidCallback? onTogglePassword,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
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
          obscureText: isPassword && obscurePassword,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.authHeaderColor,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 12,
              color: AppColors.passwordIconColor,
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
                    onPressed: onTogglePassword,
                    icon: Icon(
                      obscurePassword
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

  void _register() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      debugPrint('Register form is valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.authHeaderColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: AppColors.authHeaderColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 175,
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.4,
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        'Please sign up to get started',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.authSubtitleColor,
                        ),
                      ),
                    ],
                  ),
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
                  padding: const EdgeInsets.fromLTRB(19, 19, 19, 22),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildField(
                          label: 'NAME',
                          hint: 'John Doe',
                          controller: _nameController,
                          validator: Validator.validateName,
                        ),
                        const SizedBox(height: 17),
                        _buildField(
                          label: 'EMAIL',
                          hint: 'example@gmail.com',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validator.validateEmail,
                        ),
                        const SizedBox(height: 17),
                        _buildField(
                          label: 'PASSWORD',
                          hint: 'Enter your password',
                          controller: _passwordController,
                          validator: Validator.validatePassword,
                          isPassword: true,
                          obscurePassword: _obscurePassword,
                          onTogglePassword: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        const SizedBox(height: 17),
                        _buildField(
                          label: 'RE-TYPE PASSWORD',
                          hint: 'Confirm your password',
                          controller: _confirmPasswordController,
                          validator: (value) {
                            return Validator.validateConfirmPassword(
                              value,
                              _passwordController.text,
                            );
                          },
                          isPassword: true,
                          obscurePassword: _obscureConfirmPassword,
                          onTogglePassword: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                        const SizedBox(height: 28),
                        SizedBox(
                          width: double.infinity,
                          child: AppPrimaryButton(
                            text: 'SIGN UP',
                            onPressed: _register,
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
                        const SizedBox(height: 20),
                        Center(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Text.rich(
                              TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.mutedTextColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'LOG IN',
                                    style: TextStyle(
                                      color: AppColors.orderButtonColor,
                                      fontWeight: FontWeight.w700,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
