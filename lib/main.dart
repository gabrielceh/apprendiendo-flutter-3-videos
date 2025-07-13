// mateapp para crear un main y un MyApp

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik/config/theme/app_theme.dart';
import 'package:tok_tik/presentation/providers/discover_provider.dart';
import 'package:tok_tik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
                //.. es conocido como un operador de cascada, sirve para llanmar a varios metoos de un objeto
        ChangeNotifierProvider(
          lazy: false,
          create: (_)=>DiscoverProvider()..loadNextPage()
        )
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().themeData,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: DiscoverScreen(),
        ),
      ),
    );
  }
}
/**
 * Por defecto, los providers son lazy, es decir: no se crean hasta que alguien los use.
 * lazy: false: lo crea de inmediato, apenas se construye el widget.
      Esto es útil si quieres que algo (como un fetch, init, etc.) se ejecute apenas se entra a esa pantalla o widget, 
      incluso si nadie ha escuchado al provider.
 * El .. es el operador de cascada en Dart: ejecuta un método inmediatamente después de crear el objeto, en este caso.
 */