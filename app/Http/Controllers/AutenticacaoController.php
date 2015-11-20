<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\User;
use Illuminate\Support\Facades\Hash;
use App\Http\OAuthProvider;


class AutenticacaoController extends Controller {

    public function __construct() {
        $this->middleware('jwt.auth', ['except' => ['autenticar', 'autenticarGoogle', 'autenticarGithub', 'registrar']]);
    }
    
    public function index() {
       return User::all();
    }
    
    public function autenticarGoogle(Request $request) {
        $user = OAuthProvider::getProfileGoogle($request);
        $usuario = User::where('email', $user->email)->first();
        $this->inserirOuAtualizarUsuario($usuario, $user);
        
        //gerar o token
        return $this->gerarTokenJWT($usuario);        
    }
    
    public function autenticarGithub(Request $request) {
        $user = OAuthProvider::getProfileGithub($request);
        $usuario = User::where('email', $user->email)->first();
        $this->inserirOuAtualizarUsuario($usuario, $user);
        
        //gerar o token
        return $this->gerarTokenJWT($usuario);
    }
    
    public function autenticar(Request $request) {
        $usuario = User::where('email', $request->email)->where('password', hash('sha256', $request->password))->first();
        if(empty($usuario)){
            return response()->json(['error' => '> Credenciais invalidas!!!'], 401);
        }

        return $this->gerarTokenJWT($usuario);
    }
    
    public function getUsuarioAutenticado(){
        try {
            if(!$user = JWTAuth::parseToken()->authenticate()){
                return reponse()->json(['user_not_found'], 404);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['token_expired'], $e->getStatusCode());
            
        } catch (Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['token_invalid'], $e->getStatusCode());
            
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['token_absent'], $e->getStatusCode());
        }
        
        return response()->json(compact('user'));
    }


    public function registrar(Request $request) {
        $user = new User;
        $user->nome = $request->nome;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->save();
    }
    
    private function gerarTokenJWT(User $usuario){
        try {
            $dadosAdicionais = ['nome' => $usuario->nome, 'email' => $usuario->email];
            if (!$token = JWTAuth::fromUser($usuario, $dadosAdicionais)) {
                return response()->json(['error' => 'Credenciais invalidas'], 401);
            }
        } catch (JWTException $e) {
            return response()->json(['error' => 'Erro durante a autenticação'], 500);
        }
        
        return response()->json(compact('token'));
    }
    
    private function inserirOuAtualizarUsuario($usuario, $user){
        if(empty($usuario)){
            $usuario = $user;
        } else {
            $usuario->avatar = $user->avatar;
        }
        $usuario->save();
    }

}
