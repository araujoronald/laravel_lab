<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Equipe extends Model {
    
    protected  $table = "equipe";
    
    public function competicoes() {
        return $this->belongsToMany("\App\Models\Competicao", "competicao_equipe");
    }
    
    public function atletas() {
        return $this->hasMany("\App\Models\Atleta");
    }
}
