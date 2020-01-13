<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Persona extends Model
{
    protected $table = 'persona';
    public $timestamps = false;
    use SoftDeletes;

    public function nivelUrgencia() {
    	return $this->belongsTo('App\NivelUrgencia', 'nivel_urgencia_id');
    }
}
