import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre;
  //Editar el input
  TextEditingController _textController;

  final prefs =new PreferenciasUsuario();

  @override
  void initState(){
    super.initState();

    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = new TextEditingController(text: prefs.nombre);
  }
  _setSelectedRadio(int valor) async {
    prefs.genero=valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: (prefs.colorSecundario) ? Colors.red : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.all(5.0),
            ),
            Divider(),
            SwitchListTile(
                value: _colorSecundario,
                title: Text('Color Secundario'),
                onChanged: (value) {
                  setState(() {
                    _colorSecundario = value;
                    prefs.colorSecundario = value;
                  });
                }),
            RadioListTile(
              title: Text('Masculino'),
              value: 1,
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
                title: Text('Femenino'),
                value: 2,
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el telefono'),
                onChanged: (value) {
                  _nombre=value;
                  prefs.nombre=value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
