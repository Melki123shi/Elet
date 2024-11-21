import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:let/core/routes/route_name.dart';
import 'package:let/core/utils/validation.dart';
import 'package:let/core/widgets/button_widget.dart';
import 'package:let/features/authentication/domain/entity/user_entity.dart';
import 'package:let/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:let/features/authentication/presentation/widgets/input_feild_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  var _isObsecured = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _titleController.dispose();
    _passwordController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignUpErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.redAccent,
            ),
          );
        } else if (state is SignUpSuccessState) {
          (context).goNamed(AppPath.login);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sign Up Successful'),
              backgroundColor: Colors.greenAccent,
            ),
          );
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
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        InputFieldWidget(
                          hintText: 'Full Name',
                          controller: _fullNameController,
                          context: context,
                          validation: null,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputFieldWidget(
                          hintText: 'Email',
                          controller: _emailController,
                          context: context,
                          validation: emailValidation,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputFieldWidget(
                          hintText: 'title',
                          controller: _titleController,
                          context: context,
                          validation: null,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputFieldWidget(
                          obsecured: _isObsecured,
                          hintText: 'Password',
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
                          validation: passWordValidation,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is SignUpLoadingState) {
                              return const CircularProgressIndicator();
                            }
                            return ButtonWidget(
                                context: context,
                                title: 'Sign Up',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Bloc
                                    context.read<AuthBloc>().add(
                                          SignUpEvent(
                                              user: UserEntity(
                                                  name:
                                                      _fullNameController.text,
                                                  password:
                                                      _passwordController.text,
                                                  email: _emailController.text,
                                                  title: '',
                                                  location: Location(
                                                    city:
                                                        _cityController.text ??
                                                            'Addis',
                                                    country: _countryController
                                                            .text ??
                                                        'Ethiopia',
                                                  ))),
                                        );
                                  } else {
                                    setState(() {});
                                  }
                                });
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            (context).goNamed(AppPath.login);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Do you have an account? '),
                              Text(
                                "Log In",
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
