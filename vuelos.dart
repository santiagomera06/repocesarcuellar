// ignore_for_file: unused_import

import 'Pasajero.dart';

class Vuelo {
  final int numeroVuelo;
  final String fecha;
  final String ciudadOrigen;
  final String ciudadDestino;
  List<Pasajero> listaPasajeros = [];

  Vuelo({
    required this.numeroVuelo,
    required this.fecha,
    required this.ciudadOrigen,
    required this.ciudadDestino,
  });

  get pasajeros => null;
}

set numeroVuelo(int numeroVuelo) => numeroVuelo = numeroVuelo;
set destino(String ciudadDestino) => ciudadDestino = ciudadDestino;
set origen(String ciudadOrigen) => ciudadOrigen = ciudadOrigen;
set fechaVuelo(DateTime fecha) => fecha = fecha;

int get numeroVuelo => numeroVuelo;
String get ciudadDestino => ciudadDestino;
String get ciudadOrigen => ciudadOrigen;
DateTime get fecha => fecha;
List<Pasajero> get pasajeros => pasajeros;
