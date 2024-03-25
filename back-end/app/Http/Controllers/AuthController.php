<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;

class AuthController extends Controller
{
    //
    public function register(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:8|confirmed',
        ]);
    
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()->first(),
            ], 422);
        }
    
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
        ]);
    
        return response()->json([
            'message' => 'User registered successfully.'
        ]);
    }
   
    /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request) {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);
    
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()->first(),
            ], 422);
        }
    
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $user = Auth::user();
            $token = $user->createToken('MyApp')->plainTextToken;
            $name = $user->name;
            $email = $user->email;
    
            return response()->json([
                'token' => $token,
                'user' => [
                    'id' => $user->id,
                    'name' => $name,
                    'email' => $email,
                ],
                'message' => 'User login successfully.'
            ]);
        } else {
            $user = User::where('email', $request->email)->first();
            if (!$user) {
                return response()->json([
                    'error' => 'User not found.'
                ], 404);
            } else {
                return response()->json([
                    'error' => 'Wrong credentials.'
                ], 401);
            }
        }
    }
}
