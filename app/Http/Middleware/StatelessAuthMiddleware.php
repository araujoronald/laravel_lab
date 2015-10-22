<?php

namespace App\Http\Middleware;

use Closure;

class StatelessAuthMiddleware {
    
    public function handle($request, Closure $next) {
        return Auth::onceBasic("username") ?: $next($request);
    }
}

