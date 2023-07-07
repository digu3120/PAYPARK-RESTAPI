<?php
namespace App\Http\Controllers;
use Illuminate\Support\Str;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function getUserByEmail($email)
{
    $user = User::where('email', $email)->first();
    
    if ($user) {
        $token = Str::random(60); // Generate a random token
        $user->remember_token = hash('sha256', $token);
        $user->save();
        
        return response()->json([
            'user' => $user,
            'token' => $token
        ]);
    }
    
    return response()->json(['message' => 'User not found'], 404);
}

//getUserByPhone
public function getUserByphone($phone)
{
    $user = User::where('phone', $phone)->first();
    
    if ($user) {
        $token = $user->createToken('Personal Access Token')->plainTextToken;
       
        
        return response()->json([
            'user' => array_merge($user->toArray(), ['token' => $token])
        ]);
    }
    
    return response()->json(['message' => 'User not found'], 404);
}

//check Phone and email Existance

public function checkEmailExistence(Request $request)
    {
        $email = $request->input('email');

        $user = User::where('email', $email)->first();

        $exists = $user ? true : false;

        return response()->json(['exists' => $exists]);
    }

    public function checkPhoneExistence(Request $request)
    {
        $phone = $request->input('phone');

        $user = User::where('phone', $phone)->first();

        $exists = $user ? true : false;

        return response()->json(['exists' => $exists]);
    }
}
