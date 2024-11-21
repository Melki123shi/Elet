import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:let/core/injections/injection.dart' as di;

class MultipleBlocProvider extends StatelessWidget {
  final Widget child;
  const MultipleBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => di.sl<AuthBloc>(),
        ),
        
      ],
      child: child,
    );
  }
}
