import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey< ScaffoldState >() ;
    final red = Theme.of( context ).colorScheme.error ;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer() ;
          },
          icon: const Icon( Icons.menu ),
        ),
        title: const Text( 'Inicio' ),
      ),

      drawer: NavigationDrawer(
        onDestinationSelected: (value) {
          const logoutIndex = 1 ;
          if ( value == logoutIndex ) {
            Navigator.of( context ).popUntil( ModalRoute.withName( '/account/login' ) );
          }
        },
        children: [
          SizedBox( height: 12,),
          NavigationDrawerDestination(
            icon: const Icon( Icons.home_rounded ),
            label: const Text( 'Inicio' ),
          ),

          NavigationDrawerDestination(
            icon: Icon( Icons.logout, color: red,),
            label: const Text( 'Cerrar sessión' ),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 12,
        ),
        child: ListView(
          children: [
            Text( 'ABMs',
              style: Theme.of( context ).textTheme.titleSmall,
            ),

            ListTile(
              onTap: () {
                Navigator.of( context ).pushNamed( '/patient/list' ) ;
              },
              title: const Text( 'Pacientes' ),
            ),

            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed( '/rooms/list' ) ;
              },
              title: const Text( 'Quirófanos' ),
            ),
          ],
        ),
      ),
    );
  }
}