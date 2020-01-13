<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class NivelUrgencia extends Model
{
    protected $table = 'nivel_urgencia';
    public $timestamps = false;
    use SoftDeletes;

    public function personas() {
    	return $this->hasMAny('App\Persona', 'nivel_urgencia_id');
    }
}
