<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Atleta extends Model {
    
    protected $table = "atleta";
    
    public function equipe() {
        return $this->belongsTo("\App\Models\Equipe");
    }
}
