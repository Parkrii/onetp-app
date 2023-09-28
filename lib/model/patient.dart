import 'package:onetp/model/person.dart';

class Patient extends Person {
  List< Person > relatives ;

  Patient({
    required super.name,
    required super.dni,
    required super.birthDate,
    this.relatives = const [],
  });
}

Patient? getPatient( Object? arguments ) {
  var args = arguments as Map< String, dynamic >? ;
  return args?[ 'patient' ] as Patient? ;
}