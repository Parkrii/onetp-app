class Person {
  String   name ;
  String   dni ;
  DateTime birthDate ;

  Person({
    required this.name,
    required this.dni,
    required this.birthDate
  }) ;

  String _pad( int n ) => n.toString().padLeft( 2, '0' ) ;

  String get formattedDate
    => '${ _pad( birthDate.day ) }/${ _pad( birthDate.month ) }/${ birthDate.year }' ;
}