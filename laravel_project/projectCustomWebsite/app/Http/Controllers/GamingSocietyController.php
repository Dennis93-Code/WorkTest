<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
class GamingSocietyController extends Controller
{
    public function index()     {
        return view('home');
    }
    public function about()     {
        return view('about');
    }
    public function members()   {
        return view('members');
    }
    public function events()    {
        return view('events');
    }
}
