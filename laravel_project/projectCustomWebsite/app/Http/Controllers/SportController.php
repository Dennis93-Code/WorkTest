<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use App\Models\Sports;
use Illuminate\Support\Str;

class SportController extends Controller
{
    public function create()
    {
        return view('data_input.sports_record_form');
    }

    public function index()
    {
        $sports = Sports::orderBy('id', 'asc')->get(); // Sort in ascending order
        return view('management.index', compact('sports')); // Pass data to the view
    }

    public function store(Request $request)
    {
        // Validate input
        $request->validate([
            'sports_name' => 'required|string|max:255',
            'competition_type' => 'required|string',
            'description' => 'required|string',
            'sports_type' => 'required|string',
        ]);

        // Normalize input to check for singular/plural duplicates
        $inputName = Str::lower($request->sports_name);
        $normalizedInput = Str::singular($inputName);

        // Check if a similar record exists
        $existingSports = Sports::whereRaw('LOWER(sports_name) = ?', [$normalizedInput])
            ->orWhereRaw('LOWER(sports_name) = ?', [Str::plural($normalizedInput)])
            ->first();

        if ($existingSports) {
            return redirect()->back()->withErrors(['sports_name' => 'This sport already exists in the database.'])->withInput();
        }

        // Save the record
        try {
            $sport = Sports::create([
                'sports_name' => $request->sports_name,
                'competition_type' => $request->competition_type,
                'description' => $request->description,
                'sports_type' => $request->sports_type,
            ]);

            // ✅ Flash success message (but do not redirect yet)
            return back()->with('success', 'Sport record saved successfully!');

        } catch (\Exception $e) {
            // Log the error and show a message
            Log::error("Error saving sport record: " . $e->getMessage());
            return redirect()->back()->withErrors(['error' => 'An error occurred. Please try again.'])->withInput();
        }
    }

    public function edit($id)
    {
        $sport = Sports::findOrFail($id); // Get the existing record.
        return view('management.edit', compact('sport'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'sports_name' => 'required|string|max:255',
            'competition_type' => 'required|string',
            'description' => 'required|string',
            'sports_type' => 'required|string',
        ]);

        $sport = Sports::findOrFail($id);
        $sport->update([
            'sports_name' => $request->sports_name,
            'competition_type' => $request->competition_type,
            'description' => $request->description,
            'sports_type' => $request->sports_type,
        ]);

        return redirect()->route('management.index')->with('success', 'Sport record updated successfully!');
    }

}

