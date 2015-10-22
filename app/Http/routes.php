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
});


Route::resource('/atleta', 'AtletaController', ['except' => ['create', 'edit']]);

Route::resource('/equipe', 'EquipeController', ['except' => ['create', 'edit']]);

Route::resource('/competicao', 'CompeticaoController', ['except' => ['create', 'edit']]);