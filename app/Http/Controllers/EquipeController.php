<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Equipe;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\DB;

class EquipeController extends Controller {
    
    public function __construct() {
        $this->middleware('jwt.auth');
    }
    
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
        DB::transaction(function() use ($request) {
            $equipe = new Equipe;
            $equipe->nome = $request->nome;
            $equipe->sigla = $request->sigla;
            $equipe->email = $request->email;
            $equipe->data_fundacao = $request->data_fundacao;
            $equipe->save();

            if(!empty($request->emblema)) {
                $data = str_replace('data:image/png;base64,', '', $request->emblema);
                $data = str_replace(' ', '+', $data);
                $data = base64_decode($data);
                
                
                $publicPath = 'imagens/equipes/'.$equipe->id.".png";
                $file = public_path()."/".$publicPath;
                file_put_contents($file, $data);

                $equipe->emblema = $publicPath;
                $equipe->save();
            }      
        });
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
        $equipe->nome = $request->nome;
        $equipe->sigla = $request->sigla;
        $equipe->email = $request->email;
        $equipe->data_fundacao = $request->data_fundacao;
        if(!empty($request->emblema) && $request->emblema !== $equipe->emblema) {
            $data = str_replace('data:image/png;base64,', '', $request->emblema);
            $data = str_replace(' ', '+', $data);
            $data = base64_decode($data);


            $publicPath = 'imagens/equipes/'.$equipe->id.".png";
            $file = public_path()."/".$publicPath;
            file_put_contents($file, $data);

            $equipe->emblema = $publicPath;
        }
        $equipe->save();
    }

    // Remover equipe
    public function destroy($id){
        //
    }
    
    private function montarEquipe(Equipe $equipe, Request $request){
        $equipe->nome = $request->nome;
        $equipe->sigla = $request->sigla;
        $equipe->email = $request->email;
        $equipe->data_fundacao = $request->data_fundacao;
    }
}
