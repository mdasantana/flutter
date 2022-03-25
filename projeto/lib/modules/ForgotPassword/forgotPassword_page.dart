import 'package:flutter/material.dart';
import 'package:leitor_cbarra/routes/routes.dart';
import 'package:leitor_cbarra/widgets/custom_text_form_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset de Senha'),
        backgroundColor: Color(0xFFF23827),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                          isEnabled: true,
                          maxLength: 45,
                          labelText: 'E-mail',
                          helperText: '',
                          obscureText: false,
                          validator: (value) {},
                          controller: _emailController,
                          suffixIcon: Icon(
                            Icons.email_rounded,
                            color: Color(0xFFF23827),
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
                height: 24.0,
              ),
              ElevatedButton(
                child: Text("Enviar Token"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF23827),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
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
      ),
    );
  }
}
