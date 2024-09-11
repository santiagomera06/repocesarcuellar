import 'dart:io';
import 'Pasajero.dart';
import 'Vuelos.dart';

var vuelos = <Vuelo>[];
void main() {
  int opcion;

  do {
    print('\n--- Menú ---');
    print('1. Crear un vuelo');
    print('2. Listar todos los datos de los vuelos del día');
    print('3. Agregar pasajero a un vuelo');
    print('4. Listar todos los datos de los pasajeros de un vuelo');
    print('5. Salir');
    stdout.write('Seleccione una opción: ');
    opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        crearVuelo();
        break;
      case 2:
        listarVuelosDelDia();
        break;
      case 3:
        agregarPasajeroAVuelo();
        break;
      case 4:
        listarPasajerosDeVuelo();
        break;
      case 5:
        print('Saliendo del programa...');
        break;
      default:
        print('Opción no válida. Intente nuevamente.');
    }
  } while (opcion != 5);
}

void crearVuelo() {
  print("Creando Vuelo");
  print("Ingrese el numero de vuelo: ");
  int numeroVuelo = int.parse(stdin.readLineSync()!);
  print("Ingrese el destino: ");
  String destino = stdin.readLineSync()!;
  print("Ingrese el origen: ");
  String origen = stdin.readLineSync()!;
  print("Ingrese la fecha de vuelo(YYYY-MM-DD): ");
  DateTime fechaVuelo = DateTime.parse(stdin.readLineSync()!);

  vuelos.add((numeroVuelo, destino, origen, fechaVuelo) as Vuelo);
}

void listarVuelosDelDia() {
  DateTime hoy = DateTime.now();
  var vuelosDelDia = vuelos
      .where((vuelo) =>
          vuelo == hoy.year &&
          vuelo == hoy.year &&
          vuelo == hoy.month &&
          vuelo == hoy.day)
      .toList();

  if (vuelosDelDia.isEmpty) {
    print('No hay vuelos programados para hoy.');
  } else {
    for (var vuelo in vuelosDelDia) {
      print(
          'Código: ${vuelo.numeroVuelo}, Destino: ${vuelo.ciudadDestino}, Fecha: ${vuelo.fecha.toString()}');
    }
  }
}

void agregarPasajeroAVuelo() {
  stdout
      .write('Ingrese el código del vuelo al que desea agregar un pasajero: ');
  int codigo = int.parse(stdin.readLineSync()!);

  try {
    var vuelo = vuelos.firstWhere((vuelo) => vuelo.numeroVuelo == codigo);

    // ignore: unnecessary_null_comparison
    if (vuelo != null) {
      stdout.write('Ingrese el nombre del pasajero: ');
      String pasajeroNombre = stdin.readLineSync()!;

      stdout.write('Ingrese el apellido del pasajero: ');
      String pasajeroApellido = stdin.readLineSync()!;

      stdout.write('Ingrese el email del pasajero: ');
      String pasajeroEmail = stdin.readLineSync()!;

      Pasajero? pasajeroExistente =
          Pasajero(1, pasajeroNombre, pasajeroApellido, pasajeroEmail);
      vuelo.pasajeros.add(pasajeroExistente);
      print('Pasajero agregado exitosamente.');
    } else {
      print('Vuelo no encontrado.');
    }
  } catch (e) {
    print('Vuelo no encontrado.');
    print(e.toString());
  }
}

void listarPasajerosDeVuelo() {
  stdout.write('Ingrese el código del vuelo para listar sus pasajeros: ');
  int codigo = int.parse(stdin.readLineSync()!);
  var vuelo = vuelos.firstWhere((vuelo) => vuelo.numeroVuelo == codigo);

  // ignore: unnecessary_null_comparison
  if (vuelo != null) {
    if (vuelo.pasajeros.isEmpty) {
      print('No hay pasajeros en este vuelo.');
    } else {
      print('Pasajeros del vuelo ${vuelo.numeroVuelo}:');
      for (var pasajero in vuelo.pasajeros) {
        print(
            'nombre: ${pasajero.nombre}, apellido: ${pasajero.apellido}, email: ${pasajero.email}');
      }
    }
  } else {
    print('Vuelo no encontrado.');
  }
}
