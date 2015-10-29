<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Equipe;

class EquipeController extends Controller {
    
    // Listagem das equipes
    public function index() {
        return Equipe::all();
    }
   
    // Chamada para montar página de criação uma nova equipe
    public function create(){
        //
    }
    
    // Persistir nova equipe
    public function store(Request $request) {
        $equipe = new Equipe;
        $this->persist($equipe, $request);
    }

    // Exibir equipe
    public function show($id){
        return Equipe::find($id);
    }
    
    // Chamada para montar página de edição uma nova equipe
    public function edit($id){
        return Equipe::find($id);
    }
    
    // Atualizar uma equipe
    public function update(Request $request, $id){
        $equipe = Equipe::find($id);
        $this->persist($equipe, $request);
    }

    // Remover equipe
    public function destroy($id){
        //
    }
    
    private function persist(Equipe $equipe, Request $request){
        $equipe->nome = $request->nome;
        $equipe->sigla = $request->sigla;
        $equipe->emblema = $request->emblema;
        $equipe->email = $request->email;
        $equipe->data_fundacao = $request->data_fundacao;
        $equipe->save();
    }
}
