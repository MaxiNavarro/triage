<?php

namespace App\Http\Controllers;

use App\NivelUrgencia;
use Illuminate\Http\Request;

class NivelUrgenciaController extends Controller 
{
    public function listar() {
        return NivelUrgencia::with('personas')->get();
    }

    public function obtenerUno($id) {
        return NivelUrgencia::with('personas')->find($id);
    }

    public function agregar(Request $request) {
        $obj = new NivelUrgencia();
        $obj->color = $request->color;
        $obj->tipo_urgencia = $request->tipo_urgencia;
        $obj->espera_maxima = $request->espera_maxima;
        $obj->save();
        return $obj;
    }

    public function borrar($id) {
        $obj = NivelUrgencia::find($id);
        $obj->delete();
    }

    public function actualizar(Request $request, $id) {
        $obj = NivelUrgencia::find($id);
        $obj->color = $request->color;
        $obj->tipo_urgencia = $request->tipo_urgencia;
        $obj->espera_maxima = $request->espera_maxima;
        $obj->save();
        return $obj;
    }
}
