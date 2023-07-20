<?php
namespace App\Http\Controllers;
use Illuminate\Support\Str;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
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
        public function getEmailPhone(Request $request)
    {
        $phone = $request->header('phone');
        $email = $request->header('email');

        // Query your database or perform any data retrieval logic based on the phone and email values
        // For example, you can retrieve data from a model using Eloquent:

        // Assuming you have a 'User' model
        $user = User::where('phone', $phone)
            ->where('email', $email)
            ->first();

        if ($user) {
            // Return the desired data as a JSON response
            return response()->json($user, 200);
        } else {
            // Return an error response if no matching data is found
            return response()->json(['error' => 'Data not found'], 404);
        }
    }
    //Forget Password_check User Existance

    public function checkUserExists(Request $request)
    {
        $request->validate([
            'option' => 'required|in:email,phone',
            'value' => 'required',
        ]);

        $option = $request->input('option');
        $value = $request->input('value');

        $user = null;

        if ($option === 'email') {
            $user = User::where('email', $value)->first();
        } elseif ($option === 'phone') {
            $user = User::where('phone', $value)->first();
        }

        if ($user) {
            // User exists
            return response()->json([
                'message' => 'User exists',
                'user' => $user,
            ]);
        } else {
            // User not found
            return response()->json([
                'message' => 'User not found',
            ], 404);
        }
    }

    public function updatePassword(Request $request)
    {
        $request->validate([
            'phone' => 'required|numeric|digits_between:10,15',
            'password' => 'required|string|min:6|confirmed',
        ]);

        $phone = $request->input('phone');
        $password = $request->input('password');

        // Find the user by the provided phone number
        $user = User::where('phone', $phone)->first();

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        // Update the user's password
        $user->password = Hash::make($password);
        $user->save();

        return response()->json(['message' => 'Password updated successfully']);
    }
}
