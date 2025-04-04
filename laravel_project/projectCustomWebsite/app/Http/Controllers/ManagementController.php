<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Sports;
class ManagementController extends Controller
{
    public function index()
    {
        $sports = Sports::all(); // Fetch all sports
        return view('management.index', compact('sports'));
    }
    public function management()
    {
        return view('management.index'); // If you prefer to keep 'management' method
    }
}
