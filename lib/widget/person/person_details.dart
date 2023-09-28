import 'package:flutter/material.dart';
import 'package:onetp/model/person.dart';

class PersonDetails extends StatelessWidget {
  const PersonDetails({
    super.key,
    required this.person
  });

  final Person person;

  @override
  Widget build(BuildContext context) {

    return ListView(
      shrinkWrap: true,
      children: [
        PatientAttribute( 'Nombre', person.name ),
        PatientAttribute( 'DNI', person.dni ),
        PatientAttribute( 'Fecha de nacimiento', person.formattedDate ),
    ] ) ;
  }
}

class PatientAttribute extends StatelessWidget {
  const PatientAttribute( this.name, this.value, { super.key, });

  final String name ;
  final Object value ;

  @override
  Widget build(BuildContext context) {
    final nameStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold
    ) ;

    return ListTile( title: Wrap(children: [
      Text( "$name: ", style: nameStyle ),
      Text( "$value" ),
    ] ) );
  }
}