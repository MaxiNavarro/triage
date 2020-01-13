<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//Persona
Route::get('/personas','PersonaController@listar');
Route::get('/personas/{id}','PersonaController@obtenerUno');
Route::post('/personas','PersonaController@agregar');
Route::delete('/personas/{id}','PersonaController@borrar');
Route::put('/personas/{id}','PersonaController@actualizar');

//NivelUrgencia
Route::get('/niveles_de_urgencia','NivelUrgenciaController@listar');
Route::get('/niveles_de_urgencia/{id}','NivelUrgenciaController@obtenerUno');
Route::post('/niveles_de_urgencia','NivelUrgenciaController@agregar');
Route::delete('/niveles_de_urgencia/{id}','NivelUrgenciaController@borrar');
Route::put('/niveles_de_urgencia/{id}','NivelUrgenciaController@actualizar');