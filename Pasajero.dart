class Pasajero {
  int? _id;
  String? nombres;
  String? apellidos;
  String? correo;

  Pasajero(this._id, this.nombres, this.apellidos, this.correo) {
    this._id;
    this.nombres;
    this.apellidos;
    this.correos;
  }

  int? get id => this._id;
  String? get nombre => this.nombres;
  String? get apellido => this.apellidos;
  String? get correos => this.correos;

  set id(int? id) => this._id = id;
  set nombre(String? nombre) => this.nombres = nombre;
  set apellido(String? apellidos) => this.apellidos = apellidos;
  set correos(String? correos) => this.correos = correos;

  @override
  String toString() {
    return 'id: $_id, nombres: $nombres, apellidos: $apellidos, correo: $correos}';
  }
}
