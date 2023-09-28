import 'package:flutter/material.dart';
import 'package:onetp/widget/text_input_field.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // late LoginRequestModel requestModel;
  late String passwordValue;
  late String emailValue;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Iniciar Sesion',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 24),
                
                TextInputField(
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validations: [
                    TextInputValidation.required(),
                    TextInputValidation.email(),
                  ],
                  onChanged: (value) {
                    emailValue = value;
                  },
                ),
                SizedBox(height: 16),
                TextInputField.password(
                  label: const Text('Contraseña'),
                  validations: [TextInputValidation.required()],
                  onChanged: (value) {
                    passwordValue = value;
                  },
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Nuevo?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/account/register');
                          },
                          child: const Text('Registrarse'),
                        ),
                      ],
                    ),
                    FilledButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // requestModel = LoginRequestModel(
                          //     email: emailValue, password: passwordValue);

                          // login(requestModel);
                          Navigator.pushNamed(context, '/home');
                        }
                      },
                      child: const Text('Ingresar'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
