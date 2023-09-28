import 'package:flutter/material.dart';
import 'package:onetp/widget/text_input_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                  'Registrarse',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 24),
                TextInputField(
                  labelText: 'Email',
                  validations: [TextInputValidation.required()],
                ),
                SizedBox(height: 16),
                TextInputField.password(
                  label: const Text('Contraseña'),
                  validations: [TextInputValidation.required()],
                ),
                SizedBox(height: 12),
                TextInputField.password(
                  label: const Text('Confirmar contraseña'),
                  validations: [TextInputValidation.required()],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Ya tienes cuenta?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/account/login');
                          },
                          child: const Text('Ingresar'),
                        ),
                      ],
                    ),
                    FilledButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/account/login');
                        }
                      },
                      child: const Text('Registrar'),
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
