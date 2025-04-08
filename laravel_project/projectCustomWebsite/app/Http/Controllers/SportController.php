<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use App\Models\Sports;
use Illuminate\Support\Str;
use WebSocket\Client;

class SportController extends Controller
{
    public function create()
    {
        return view('data_input.sports_record_form');
    }

    public function index()
    {
        $sports = Sports::orderBy('id', 'asc')->get();
        return view('management.index', compact('sports'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'sports_name' => 'required|string|max:255',
            'competition_type' => 'required|string',
            'description' => 'required|string',
            'sports_type' => 'required|string',
        ]);

        // Check for duplicates
        $inputName = Str::lower($request->sports_name);
        $normalizedInput = Str::singular($inputName);

        $existingSports = Sports::whereRaw('LOWER(sports_name) = ?', [$normalizedInput])
            ->orWhereRaw('LOWER(sports_name) = ?', [Str::plural($normalizedInput)])
            ->first();

        if ($existingSports) {
            return redirect()->back()
                ->withErrors(['sports_name' => 'This sport already exists in the database.'])
                ->withInput();
        }

        try {
            $sport = Sports::create([
                'sports_name' => $request->sports_name,
                'competition_type' => $request->competition_type,
                'description' => $request->description,
                'sports_type' => $request->sports_type,
            ]);

            // Sync with Odoo
            $this->sendToOdoo();

            return back()->with('success', 'Sport record saved successfully!');
        } catch (\Exception $e) {
            Log::error("Error saving sport record: " . $e->getMessage());
            return redirect()->back()
                ->withErrors(['error' => 'An error occurred. Please try again.'])
                ->withInput();
        }
    }

    public function edit($id)
    {
        $sport = Sports::findOrFail($id);
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

        try {
            $sport = Sports::findOrFail($id);
            $sport->update([
                'sports_name' => $request->sports_name,
                'competition_type' => $request->competition_type,
                'description' => $request->description,
                'sports_type' => $request->sports_type,
            ]);

            // Sync with Odoo
            $this->sendToOdoo();

            return redirect()->route('management.index')
                ->with('success', 'Sport record updated successfully!');
        } catch (\Exception $e) {
            Log::error("Error updating sport record: " . $e->getMessage());
            return redirect()->back()
                ->withErrors(['error' => 'An error occurred. Please try again.'])
                ->withInput();
        }
    }

    public function destroy($id)
    {
        try {
            $sport = Sports::findOrFail($id);
            $sport->delete();

            // Sync with Odoo
            $this->sendToOdoo();

            return back()->with('success', 'Sport record deleted successfully!');
        } catch (\Exception $e) {
            Log::error("Error deleting sport record: " . $e->getMessage());
            return back()->with('error', 'Failed to delete sport record.');
        }
    }

    private function sendToOdoo()
    {
        try {
            $sports = Sports::select('id', 'sports_name', 'competition_type', 'sports_type')
                        ->orderBy('id')
                        ->get()
                        ->toArray();

            $wsData = [
                'type' => 'sports_sync',
                'payload' => $sports
            ];

            $client = new Client("ws://localhost:9001/sports_dashboard", ['timeout' => 5]);
            $client->send(json_encode($wsData));
            $client->close();

            return true;
        } catch (\Exception $e) {
            Log::error("WebSocket Error: " . $e->getMessage());
            return false;
        }
    }
}