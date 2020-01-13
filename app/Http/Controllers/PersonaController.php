<?php

namespace App\Http\Controllers;

use App\Persona;
use Illuminate\Http\Request;

class PersonaController extends Controller
{
    public function listar() {
        return Persona::with('nivelUrgencia')->where('fecha_egreso',null)->get();
    }

    public function obtenerUno($id) {
        return Persona::with('nivelUrgencia')->where('fecha_egreso',null)->find($id);
    }

    public function agregar(Request $request) {
        $obj = new Persona();
        $obj->nombre = $request->nombre;
        $obj->apellido = $request->apellido;
        $obj->edad = $request->edad;
        $obj->descripcion_estado = $request->descripcion_estado;
        $obj->fecha_ingreso = date('Y-m-d h:i:s');
        $obj->nivel_urgencia_id = $request->nivel_urgencia_id;
        $obj->save();
        return $obj;
    }

    public function borrar($id) {
        $obj = Persona::find($id);
        $obj->delete();
    }

    public function actualizar(Request $request, $id) {
        $obj = Persona::find($id);
        $obj->nombre = $request->nombre;
        $obj->apellido = $request->apellido;
        $obj->edad = $request->edad;
        $obj->descripcion_estado = $request->descripcion_estado;
        $obj->fecha_egreso = $request->fecha_egreso;
        $obj->nivel_urgencia_id = $request->nivel_urgencia_id;
        $obj->save();
        return $obj;
    }
}
