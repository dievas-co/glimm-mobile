import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glimm/core/theme/glimm_theme.dart';
import 'package:glimm/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:glimm/features/diary/presentation/pages/timeline_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: GlimmColors.error,
                ),
              );
            },
            authenticated: (user) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const TimelinePage()),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Glimm',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 8,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Capture the fleeting thought.',
                    style: TextStyle(fontSize: 14, color: GlimmColors.grey700),
                  ),
                  const SizedBox(height: 80),
                  state.maybeWhen(
                    loading: () => const CircularProgressIndicator(
                      color: GlimmColors.black,
                    ),
                    orElse: () => ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          const AuthEvent.signInWithGoogle(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlimmColors.black,
                        foregroundColor: GlimmColors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.login),
                          SizedBox(width: 12),
                          Text('Sign in with Google'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
