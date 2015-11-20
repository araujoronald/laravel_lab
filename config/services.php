<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Stripe, Mailgun, Mandrill, and others. This file provides a sane
    | default location for this type of information, allowing packages
    | to have a conventional place to find your various credentials.
    |
    */

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
    ],

    'mandrill' => [
        'secret' => env('MANDRILL_SECRET'),
    ],

    'ses' => [
        'key'    => env('SES_KEY'),
        'secret' => env('SES_SECRET'),
        'region' => 'us-east-1',
    ],

    'stripe' => [
        'model'  => App\User::class,
        'key'    => env('STRIPE_KEY'),
        'secret' => env('STRIPE_SECRET'),
    ],
    
    'google' => [
        'client_id' => '571732240769-3trpjtbatlm1n98v0c50m2u5rqhgfoep.apps.googleusercontent.com',
        'client_secret' => 'R5CVFquCIr5b28qsv1aeTGMB',
        'redirect' => 'http://localhost',
    ],
    
    'github' => [
    'client_id' => 'bbb8298bf84e51ae6e16',
    'client_secret' => '9b764f5c3f0264c26f33e0187f741dcefe22e3a9',
    'redirect' => 'http://localhost',
],

];
