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
        $user->nome = $userOAuthResponse->displayName;
        $user->email = $userOAuthResponse->emails[0]->value;
        $user->avatar = $userOAuthResponse->image->url;   
        return $user;
    }
    
    public static function getProfileFacebook($request) {  
        $provider = Socialite::driver('facebook');
        
        $provider->setRequest($request);        
        $userOAuth = $provider->stateless()->user();

        $user = new User();
        $user->nome = $userOAuth->getName();
        $user->email = $userOAuth->getEmail();
        $user->avatar = $userOAuth->getAvatar();        
        return $user;
    }
    
    public static function getProfileGithub($request) {  
        $provider = Socialite::driver('github');
        
        $provider->setRequest($request);        
        $userOAuth = $provider->stateless()->user();

        $user = new User();
        $user->nome = $userOAuth->getName();
        $user->email = $userOAuth->getEmail();
        $user->avatar = $userOAuth->getAvatar();        
        return $user;
    }
}
