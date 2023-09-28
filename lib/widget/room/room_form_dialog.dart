import 'package:flutter/material.dart';
import 'package:onetp/model/room.dart';
import 'package:onetp/widget/snack_bar.dart';
import 'package:onetp/widget/text_input_field.dart';

class RoomFormDialog extends StatelessWidget {
  final void Function( Room room )? onSuccess ;

  const RoomFormDialog({
    super.key, this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>() ;
    var room = Room(location: RoomLocation(roomNumber: 0)) ;
    
    return Form(
      key: formKey,
      child: AlertDialog(
        title: const Text( 'Registrar quirófano' ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox( height: 12,),
            TextInputField(
              validations: [ TextInputValidation.required(), TextInputValidation.integer() ],
              keyboardType: TextInputType.number,
              labelText: 'Número',
              onChanged: (value) {
                room.location.roomNumber = int.parse( value ) ;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () { Navigator.pop(context) ; },
            child: const Text('Cancelar'),
          ),

          TextButton(
            onPressed: () async {
              if ( formKey.currentState!.validate() ) {
                saveRoom( room )
                  .then((value) {
                    if ( value == null ) {
                      showSnackBar(context, content: 'Ocurrió un error') ;
                      return ;
                    }
                    showSnackBar(context, content: 'Quirofano guardado') ;
                    if( onSuccess != null ) {
                      onSuccess!( room ) ;
                    }
                  })
                  .onError((error, stackTrace) {
                    showSnackBar(context, content: 'Ocurrió un error') ;
                  }) ;
                  
                Navigator.pop( context ) ;
                showSnackBar(context, content: 'Guardando...') ;
              }
            },
            child: const Text( 'Guardar' )
          ),
        ],
      ),
    );
  }

}
