<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::group(['prefix' => 'api'], function() {
    Route::resource('autenticacao', 'AutenticacaoController', ['only' => ['index']]);
    Route::post('autenticacao', 'AutenticacaoController@autenticar');
    Route::post('autenticacao/registrar', 'AutenticacaoController@registrar');
    Route::post('autenticacao/google', 'AutenticacaoController@autenticarGoogle');
    Route::post('autenticacao/facebook', 'AutenticacaoController@autenticarFacebook');
    Route::post('autenticacao/github', 'AutenticacaoController@autenticarGithub');
    Route::get('autenticacao/usuario', 'AutenticacaoController@getUsuarioAutenticado');
});

Route::post('usuario/registrar', 'AutenticacaoController@registrar');

Route::resource('/atleta', 'AtletaController', ['except' => ['create']]);

Route::resource('/equipe', 'EquipeController', ['except' => ['create']]);

Route::resource('/competicao', 'CompeticaoController', ['except' => ['create']]);