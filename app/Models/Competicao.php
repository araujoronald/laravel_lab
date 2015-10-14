<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Competicao extends Model {
    
    protected $table = "competicao";
    
    public function equipes() {
        return $this->belongsToMany("\App\Models\Equipe", "competicao_equipe");      
    }
}
