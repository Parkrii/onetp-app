import 'package:flutter/material.dart';

import 'package:onetp/widget/home_page.dart';
import 'package:onetp/widget/account/register_page.dart';
import 'package:onetp/widget/account/login_page.dart';
import 'package:onetp/widget/patient/patient_details_page.dart';
import 'package:onetp/widget/patient/patients_form_page.dart';
import 'package:onetp/widget/patient/patients_list_page.dart';
import 'package:onetp/widget/room/rooms_list_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
      // home: LoginPage(),
      initialRoute: '/account/login',
      routes: {
        '/account/register': (context) => const RegisterPage(),
        '/account/login': (context) => LoginPage(),
        '/home': (context) => const HomePage(),
        '/patient/list': (context) => PatientsListPage(),
        '/patient/add': (context) => PatientsFormPage(),
        '/patient/edit': (context) => PatientsFormPage(),
        '/patient/details': (context) => PatientDetailsPage(),
        '/rooms/list': (context) => RoomsListPage(),
      },
    );
  }
}
