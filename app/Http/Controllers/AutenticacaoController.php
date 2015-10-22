<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\User;
use Illuminate\Support\Facades\Hash;

class AutenticacaoController extends Controller {

    public function __construct() {
        $this->middleware('jwt.auth', ['except' => ['autenticar', 'registrar']]);
    }
    
    public function index() {
       return User::all();
    }
    
    public function autenticar(Request $request) {
        $credentials = $request->only('email', 'password');

        try {
            if (!$token = JWTAuth::attempt($credentials)) {
                return response()->json(['error' => 'Credenciais invalidas'], 401);
            }
        } catch (JWTException $e) {
            return response()->json(['error' => 'Erro durante a autenticação'], 500);
        }

        return response()->json(compact('token'));
    }
    
    public function registrar(Request $request) {
        $user = new User;
        $user->nome = $request->nome;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->save();
    }

}
