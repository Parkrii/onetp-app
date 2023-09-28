import 'package:flutter/material.dart';

void showSnackBar( BuildContext context, { required String content } ) {
  var messager = ScaffoldMessenger.of(context) ;
  messager.showSnackBar( SnackBar(content: Text( content ) ) ) ;
}