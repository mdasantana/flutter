import 'package:leitor_cbarra/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:leitor_cbarra/services/auth_service.dart';
import 'package:leitor_cbarra/widgets/custom_text_form_field.dart';
import 'package:provider/src/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = true;
  bool inLogin = false;

  login() async {
    setState(() => inLogin = true);
    try {
      await context
          .read<AuthService>()
          .login(_emailController.text, _passwordController.text);
    } on AuthException catch (e) {
      setState(() => inLogin = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.menssagem),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            top: true,
            bottom: true,
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: (MediaQuery.of(context).size.width * 0.6),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomTextFormField(
                                      isEnabled: true,
                                      maxLength: 45,
                                      labelText: 'Login',
                                      helperText: '',
                                      obscureText: false,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Informe seu e-mail';
                                        }
                                      },
                                      controller: _emailController,
                                      suffixIcon: Icon(
                                        Icons.person,
                                        color: Color(0xFFF23827),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      colorLabelText: Color(0xFFF23827),
                                      colorFocusedBorder: Color(0xFFF23827),
                                      colorErrorBorder: Color(0xFFF23827)),
                                  SizedBox(height: 16.0),
                                  CustomTextFormField(
                                      isEnabled: true,
                                      maxLength: 16,
                                      labelText: 'Senha',
                                      helperText: '',
                                      obscureText: passwordVisible,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Informe sua senha!';
                                        } else if (value.length < 6) {
                                          return 'Sua senha deve ter no mínimo 6 caracteres';
                                        }
                                      },
                                      controller: _passwordController,
                                      suffixIcon: IconButton(
                                        icon: passwordVisible
                                            ? Icon(
                                                Icons.lock_outlined,
                                                color: Colors.black54,
                                              )
                                            : Icon(
                                                Icons.lock_open_outlined,
                                                color: Color(0xFFF23827),
                                              ),
                                        onPressed: () {
                                          setState(() {
                                            passwordVisible = !passwordVisible;
                                          });
                                        },
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      colorLabelText: Color(0xFFF23827),
                                      colorFocusedBorder: Color(0xFFF23827),
                                      colorErrorBorder: Color(0xFFF23827)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 22.0,
                          ),
                          ElevatedButton(
                            child: inLogin
                                ? SizedBox(
                                    width: 24.0,
                                    height: 24.0,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text("Entrar"),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                login();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 40),
                              primary: Color(0xFFF23827),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 10.0),
                              textStyle: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.forgotPassword);
                            },
                            child: Text(
                              "Esqueci minha senha",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFF23827)),
                            ),
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
      ),
    );
  }
}
