import 'package:flutter/material.dart';
import 'package:onetp/model/person.dart';

class PersonTile extends StatelessWidget {
  final Person person;
  final void Function()? onTap ;
  final void Function()? onEdit ;

  const PersonTile({
    super.key,
    required this.person,
    this.onTap,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(person.name),
      subtitle: Text(
        '${person.formattedDate} - ${person.dni}',
        semanticsLabel: 'Born: ${person.formattedDate}, DNI: ${person.dni}',
      ),
      leading: const Icon(Icons.person),
      trailing: _editButton,
    );
  }

  IconButton? get _editButton => onEdit != null 
    ? IconButton(
        onPressed: onEdit,
        icon: const Icon(Icons.edit),
      )
    : null ;
}
