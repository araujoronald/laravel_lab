<?php

namespace App\Http;

use App\User;
use Laravel\Socialite\Facades\Socialite;
use GuzzleHttp\Client;


class OAuthProvider {
    
    public static function getProfileGoogle($request) {      
        $provider = Socialite::driver('google');
        $accessToken = $provider->getAccessToken($request->code);
        
        $peopleApiUrl = 'https://www.googleapis.com/plus/v1/people/me'; 
        $headers = array('Authorization' => 'Bearer ' . $accessToken);
        $client = new Client();
        $userOAuthResponse = json_decode($client->get($peopleApiUrl, ['headers' => $headers])->getBody()->getContents());

        $user = new User;
        $user->id = $userOAuthResponse->id;
        $user->nome = $userOAuthResponse->displayName;
        $user->email = $userOAuthResponse->emails[0]->value;
        $user->avatar = $userOAuthResponse->image->url;   
        return $user;
    }
    
    public static function getProfileGithub($request) {  
        $provider = Socialite::driver('github');
       // $accessToken = $provider->getAccessToken($code);
        
        $provider->setRequest($request);        
        $userOAuth = $provider->stateless()->user();
        
//        $peopleApiUrl = 'https://api.github.com/user'; 
//        $headers = array('User-Agent' => 'Satellizer');
//        $client = new Client();
//        $userOAuthResponse = json_decode($client->get($peopleApiUrl, ['headers' => $headers, 'query' => array('accessToken' => $accessToken)])->getBody()->getContents());
//        
//        $user = new User;
//        $user->id = $userOAuthResponse->id;
//        $user->nome = $userOAuthResponse->name;
//        $user->email = $user->id.'@'.$user->nome;
        $user = new User();
        $user->id = $userOAuth->getId();
        $user->nome = $userOAuth->getName();
        $user->email = $userOAuth->getEmail();
        $user->avatar = $userOAuth->getAvatar();        
        return $user;
    }
}
