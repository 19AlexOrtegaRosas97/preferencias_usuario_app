import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Preferencias de Usuario'),
          backgroundColor: (prefs.colorSecundario) ? Colors.red : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Color Secundario: ${prefs.colorSecundario}'),
            Divider(),
            Text('Genero: ${prefs.genero}'),
            Divider(),
            Text('Nombre de Usuario: ${prefs.nombre}'),
            Divider(),
          ],
        ),
      ),
    );
  }
}
