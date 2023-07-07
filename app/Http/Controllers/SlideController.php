<?php


namespace App\Http\Controllers;
use App\Models\Slide;

use Illuminate\Http\Request;

class SlideController extends Controller
{


public function index()
{
    $slides = Slide::all();

    return response()->json(['slides' => $slides]);
}

}
