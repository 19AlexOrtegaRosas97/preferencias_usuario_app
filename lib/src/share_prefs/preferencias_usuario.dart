import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  //Singletos para solo manejar una instancia de las preferencias
  static final PreferenciasUsuario _instacia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instacia;
  }

  PreferenciasUsuario._internal();
  SharedPreferences _prefs;

  initPrefs()async{
    this._prefs = await SharedPreferences.getInstance();
  }

  //Ninguna de esats propiedades se usa
  //bool _colorSecundario;
  //int _genero;
  //String _nombre;

  //get y set
  get genero{
    return _prefs.getInt('genero') ?? 1;
  }
  set genero(value){
    _prefs.setInt('genero', value);
  }

  get colorSecundario{
    return _prefs.getBool('colorSecundario') ?? false;
  }
  set colorSecundario(bool value){
    _prefs.setBool('colorSecundario', value);
  }

  get nombre{
    return _prefs.getString('nombre') ?? '';
  }
  set nombre(String value){
    _prefs.setString('nombre', value);
  }

  get ultimaPagina{
    return _prefs.getString('ultimaPagina') ?? 'home';
  }
  set ultimaPagina(String value){
    _prefs.setString('ultimaPagina', value);
  }

}
