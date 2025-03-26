<?php
use App\Models\Sport;
use Illuminate\Http\Request;
class SportController extends Controller
{
    public function create()
    {
        return view('data_input.sports_record_form');
    }
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:sports|max:255',
        ]);
        Sport::create(['name' => $request->name]);
        return redirect()->route('sports.create')->with('success', 'Sport recorded successfully!');
    }
}
