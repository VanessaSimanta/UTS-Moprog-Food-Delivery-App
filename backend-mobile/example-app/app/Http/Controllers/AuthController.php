<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    // Register
    public function register(Request $request) {
        // Validate request
        $attrs = $request->validate([
            'fname' => 'required|string',
            'lname' => 'required|string',
            'username' => 'required|string',
            'email' => 'required|email|unique:users,email',
            'phoneNum' => 'required|string',
            'password' => 'required|min:6|confirmed',
        ]);

        // Create user
        $user = User::create([
            'fname' => $attrs['fname'],
            'lname' => $attrs['lname'],
            'username' => $attrs['username'],
            'email' => $attrs['email'],
            'phoneNum' => $attrs['phoneNum'],
            'password' => Hash::make($attrs['password']),
        ]);

        // Generate and return token
        return response([
            'user' => $user,
            'token' => $user->createToken('secret')->plainTextToken,
        ], 201);
    }

    // Login User
    public function login(Request $request) {
        // Validate request
        $attrs = $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:6',
        ]);
    
        if (!Auth::attempt($attrs)){
            return response([
                'message' => 'Invalid Credential'
            ], 403);
        }
        
        return response([
            'user' => auth()->user(),
            'token' =>auth()->user()->createToken('secret')->plainTextToken,
        ]);
    }
    

    // Logout user
    public function logout() {
        auth()->user()->tokens()->delete();
        return response([
            'message' => 'Logout success'
        ], 200);
    }

    // Get User Details
    public function user() {
        return response([
            'user' => auth()->user()
        ], 200);
    }

    //update user details
    public function updateUserDetails(Request $request){
        $request->validate([
            'address' => 'string|max:255',
            'dob' => 'date',
        ]);

        $user = auth()->user();
        $user->address = $request->address;
        $user->dob = $request->dob;
        $user->save();
        logger()->info('Received address: ' . $request->address);
logger()->info('Received dob: ' . $request->dob);


        return response()->json(['message' => 'User details updated successfully'], 200);
    }

    //delete account
    public function destroy(Request $request){
        $user = $request->user();
        $user->delete();
        return response()->json(['message' => 'Account deleted successfully'], 200);
    }
}
