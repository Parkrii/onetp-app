import 'package:flutter/material.dart';

class TextInputValidation {
  static const _emailRegex = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$' ;
  final bool Function( String input ) evaluate ;
  final String errorMessage ;

  TextInputValidation.required( { this.errorMessage = 'Required field' } )
    : evaluate = (( input ) => input.isNotEmpty) ;

  TextInputValidation.email( { this.errorMessage = 'Invalid email' } )
    : evaluate = ( ( input ) => RegExp( _emailRegex ).hasMatch(input) ) ;

  TextInputValidation.integer( { this.errorMessage = 'Insert a number'} )
    : evaluate = ( ( input ) => RegExp( r'[0-9]+' ).hasMatch( input ) ) ;
}

class TextInputField extends StatelessWidget {
  final Widget? label;
  final String? labelText;
  final String? initialText ;
  final bool    obscureText ;
  final Function( String value )? onChanged;
  final List< TextInputValidation > validations ;
  final TextInputType? keyboardType ;

  const TextInputField({
    super.key,
    this.label,
    this.initialText,
    this.obscureText = false,
    this.onChanged,
    this.labelText,
    this.validations = const [],
    this.keyboardType,
  } );

  const TextInputField.password({
    super.key,
    this.label = const Text( 'Password' ),
    this.onChanged,
    this.obscureText = true,
    this.labelText,
    this.validations = const [],
    this.keyboardType,
  }): initialText = '' ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        for ( final validation in validations ) {
          if ( !validation.evaluate( value ?? '' ) ) {
            return validation.errorMessage ;
          }
        }
        return null ;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        label:  label,
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      obscureText: obscureText,
      initialValue: initialText,
      onChanged: onChanged,
    );
  }
}
