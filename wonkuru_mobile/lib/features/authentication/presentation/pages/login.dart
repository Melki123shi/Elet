import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:let/core/constants/colors.dart';
import 'package:let/core/routes/route_name.dart';
import 'package:let/core/utils/validation.dart';
import 'package:let/core/widgets/button_widget.dart';
import 'package:let/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:let/features/authentication/presentation/widgets/input_feild_widget.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _isObsecured;

  @override
  void initState() {
    super.initState();
    _isObsecured = true;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
      print('sssssssssssssssssssssssssssssssssss $state');
        if (state is UnAuthenticatedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.redAccent,
            ),
          );
        } else if (state is AuthenticatedState) {
          context.goNamed(AppPath.home);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 100, 30, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        const Text(
                          "👋 Hi, Welcome Back",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const Text(
                          "Log In",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        InputFieldWidget(
                          hintText: 'Enter your email',
                          controller: _emailController,
                          context: context,
                          validation: emailValidation,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InputFieldWidget(
                          obsecured: _isObsecured,
                          hintText: 'Enter your Password',
                          controller: _passwordController,
                          context: context,
                          icon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObsecured = !_isObsecured;
                                });
                              },
                              icon: !_isObsecured
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          validation: null,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is LogInLoadingState) {
                              return const CircularProgressIndicator();
                            }
                            return ButtonWidget(
                                bgColor: primary,
                                context: context,
                                title: 'Log In',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Bloc
                                    context.read<AuthBloc>().add(
                                          LogInEvent(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          ),
                                        );
                                  }
                                });
                          },
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     (context).pushNamed(AppPath.forgetPassword);
                        //   },
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       const Text('Forgot your password?'),
                        //       const SizedBox(
                        //         width: 4,
                        //       ),
                        //       ForwardWidget(
                        //           color: Theme.of(context).primaryColor),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 15.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            (context).goNamed(AppPath.signup);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't you have an account? "),
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        )
                      ]),
                ))),
      ),
    );
  }
}
