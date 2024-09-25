<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class AuthController extends Controller
{
    //Register
    public function register(Request $request) {
        //validate
        $attrs = $request -> validate([
            'fname' => 'required|string',
            'lname' => 'required|string',
            'username' => 'required|string',
            'email' => 'required|email|unique:users,email',
            'phoneNum' => 'required|string',
            'password' => 'required|min:6|confirmed',
        ]);

        //create user
        $user = User::create([
            'fname' => $attrs['fname'],
            'lname' => $attrs['lname'],
            'username' => $attrs['username'],
            'email' => $attrs['email'],
            'phoneNum' => $attrs['phoneNum'],
            'password' => bcrypt ($attrs['password']),
        ]);

        return response([
            'user' => $user,
            'token' => $user -> createToken('secret') -> plainTextToken,
        ]);
    }

    //logout
    // public function logout() {
    //     auth() -> user() -> tokens() -> delete();
    //     return response([
    //         'message' => 'logout success'
    //     ], 200);
    // }
}