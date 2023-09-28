import 'package:flutter/material.dart';
import 'package:onetp/model/room.dart';
import 'package:onetp/widget/back_button.dart';
import 'package:onetp/widget/snack_bar.dart';

import 'room_form_dialog.dart';

class RoomsListPage extends StatefulWidget {
  @override
  State<RoomsListPage> createState() => _RoomsListPageState();
}

class _RoomsListPageState extends State<RoomsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: const Text( 'Quirófanos' ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog( context: context, builder: ( context ) {
                return RoomFormDialog(onSuccess: (room) {
                  setState(() {});
                }) ;
              } ) ;
            },
            icon: const Icon( Icons.add ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showError( String error ) => showSnackBar(context, content: error) ;
          ( () async {
            try {
              bool ok = await alert() ;
              if ( ok ) {
                setState(() {});
                return ;
              }
            } catch ( e ) { /**/ }
            showError('Error') ;
          } )() ;
        },
        icon: const Icon( Icons.warning_rounded ),
        label: const Text( 'Emergency' ),
      ),

      body: FutureBuilder< List< Room >? >(
        future: getRooms(),

        builder: (context, snapshot) {
          if ( snapshot.hasError ) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if ( snapshot.hasData ) {
            if ( snapshot.data == null ) {
              return Center(child: Text( 'Ocurrió un error' ));
            }
            return RoomsList( snapshot.data!, setState: setState, ) ;
          }
          return Center(
            child: const CircularProgressIndicator.adaptive(
              semanticsLabel: 'Loading rooms list...',
            ),
          ) ;
        },
      )
    ) ;
  }
}

class RoomsList extends StatelessWidget {
  const RoomsList( this.rooms, { super.key, required this.setState, } );

  final List< Room > rooms ;
  final void Function(void Function()) setState ;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: rooms.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => RoomTile( rooms[ index ], setState: setState, ) ,
    ) ;
  }
}

class RoomTile extends StatelessWidget {
  const RoomTile( this.room, { super.key, required this.setState });

  final Room room;
  final void Function(void Function()) setState ;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: !room.isOccupied,
      title: Text('Quirófano N° ${ room.location.roomNumber }'),
      subtitle: Text( room.isOccupied ? 'Ocupado' : 'Disponible' ),
      trailing: MenuAnchor(
        builder: (context, menu, child) => IconButton(
          icon: Icon( Icons.more_vert ),
          onPressed: () {
            if ( menu.isOpen ) {
              menu.close() ;
            } else {
              menu.open() ;
            }
          },
        ),

        menuChildren: [
          MenuItemButton(
            onPressed: () {
              showError( String error ) => showSnackBar(context, content: error) ;
              ( () async {
                try {
                  bool ok = await disocupy( room ) ;
                  if ( ok ) {
                    setState( () {} ) ;
                  }
                } catch( e ) { /**/ }
                showError( 'Error' ) ;
              })() ;
            },
            child: const Text( 'Desocupar' ),
          )
        ],
      ),
    );
  }
}