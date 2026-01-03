import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:glimm/core/di/injection.dart';
import 'package:glimm/core/theme/glimm_theme.dart';
import 'package:glimm/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:glimm/features/auth/presentation/pages/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureDependencies();

  runApp(const GlimmApp());
}

class GlimmApp extends StatelessWidget {
  const GlimmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<AuthBloc>()..add(const AuthEvent.checkAuthStatus()),
        ),
      ],
      child: MaterialApp(
        title: 'Glimm',
        theme: GlimmTheme.light,
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
