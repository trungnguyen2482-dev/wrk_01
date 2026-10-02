import 'package:flutter/material.dart';

import 'widgets/login_background.dart';
import 'widgets/login_illustration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Vui lòng nhập email.';
    }
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
      return 'Email không đúng định dạng.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu.';
    }
    return null;
  }

  void _submit() {
    final email = _emailController.text.trim();
    if (_emailController.text != email) {
      _emailController.text = email;
    }
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('Dữ liệu hợp lệ — đây là bản demo.')),
      );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final keyboardVisible = MediaQuery.viewInsetsOf(context).bottom > 0;
    final labelStyle = theme.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const LoginBackground(),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final illustrationHeight = keyboardVisible
                    ? 84.0
                    : constraints.maxHeight < 800
                    ? 136.0
                    : 176.0;

                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: (constraints.maxHeight - 40).clamp(
                        0.0,
                        double.infinity,
                      ),
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 440),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: illustrationHeight,
                              child: const LoginIllustration(),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Lên kèo!',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Baloo2',
                                fontWeight: FontWeight.w800,
                                fontSize: 56,
                                height: 1.1,
                                letterSpacing: -1.2,
                                color: Color(0xFF4E2398),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Tụ đủ bạn, lên kèo chơi!',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF574771),
                              ),
                            ),
                            const SizedBox(height: 26),
                            Container(
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(28),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x0C5B21B6),
                                    blurRadius: 32,
                                    offset: Offset(0, 12),
                                  ),
                                ],
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Đăng nhập',
                                      style: theme.textTheme.headlineMedium
                                          ?.copyWith(
                                            fontFamily: 'Baloo2',
                                            fontWeight: FontWeight.w800,
                                            color: const Color(0xFF241348),
                                          ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text('Email', style: labelStyle),
                                    const SizedBox(height: 8),
                                    Semantics(
                                      label: 'Email',
                                      child: TextFormField(
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                        autocorrect: false,
                                        decoration: const InputDecoration(
                                          hintText: 'Nhập email của bạn',
                                          prefixIcon: Icon(
                                            Icons.mail_outline_rounded,
                                          ),
                                          errorMaxLines: 3,
                                        ),
                                        validator: _validateEmail,
                                      ),
                                    ),
                                    const SizedBox(height: 18),
                                    Text('Mật khẩu', style: labelStyle),
                                    const SizedBox(height: 8),
                                    Semantics(
                                      label: 'Mật khẩu',
                                      child: TextFormField(
                                        controller: _passwordController,
                                        obscureText: _obscurePassword,
                                        autocorrect: false,
                                        enableSuggestions: false,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          hintText: 'Nhập mật khẩu',
                                          prefixIcon: const Icon(
                                            Icons.lock_outline_rounded,
                                          ),
                                          errorMaxLines: 3,
                                          suffixIcon: IconButton(
                                            tooltip: _obscurePassword
                                                ? 'Hiện mật khẩu'
                                                : 'Ẩn mật khẩu',
                                            onPressed: () {
                                              setState(() {
                                                _obscurePassword =
                                                    !_obscurePassword;
                                              });
                                            },
                                            icon: Icon(
                                              _obscurePassword
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                        .visibility_off_outlined,
                                            ),
                                          ),
                                        ),
                                        validator: _validatePassword,
                                        onFieldSubmitted: (_) => _submit(),
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    FilledButton(
                                      onPressed: _submit,
                                      child: const Text('Đăng nhập'),
                                    ),
                                    const SizedBox(height: 18),
                                    Text(
                                      'Bản demo — chưa kết nối tài khoản',
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: const Color(0xFF80709F),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
