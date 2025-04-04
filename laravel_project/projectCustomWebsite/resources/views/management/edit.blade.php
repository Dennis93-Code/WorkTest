@extends('layouts.layout')
@section('title', 'Edit Sport')
@section('content')

<div class="max-w-4xl mx-auto p-6 bg-white shadow rounded">
    <h2 class="text-xl font-bold mb-4">Edit Sport</h2>

    @if ($errors->any())
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4">
            <ul class="list-disc pl-5">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('sports.update', $sport->id) }}" method="post" class="space-y-4">
        @csrf
        @method('post') {{-- Use PUT for updates --}}
        <div>
            <label class="block font-semibold mb-1">Sport Name:</label>
            <input type="text" name="sports_name" value="{{ old('sports_name', $sport->sports_name) }}" 
                class="w-full border border-gray-300 px-4 py-2 rounded focus:outline-none focus:ring focus:border-blue-300" required>
        </div>

        <!-- Competition Type Dropdown -->
        <div>
            <label class="block font-semibold mb-1">Competition Type:</label>
            <select name="competition_type" class="w-full border border-gray-300 px-4 py-2 rounded focus:outline-none focus:ring focus:border-blue-300" required>
                <option value="" disabled>Select Competition Type</option>
                <option value="Team Match" {{ $sport->competition_type == 'Team Match' ? 'selected' : '' }}>Team Match</option>
                <option value="Last Man Standing" {{ $sport->competition_type == 'Last Man Standing' ? 'selected' : '' }}>Last Man Standing</option>
            </select>
        </div>

        <div>
            <label class="block font-semibold mb-1">Description:</label>
            <textarea name="description" required 
                class="w-full border border-gray-300 px-4 py-2 rounded focus:outline-none focus:ring focus:border-blue-300">{{ old('description', $sport->description) }}</textarea>
        </div>

        <!-- Sports Type Dropdown -->
        <div>
            <label class="block font-semibold mb-1">Sports Type:</label>
            <select name="sports_type" class="w-full border border-gray-300 px-4 py-2 rounded focus:outline-none focus:ring focus:border-blue-300" required>
                <option value="" disabled>Select Sports Type</option>
                <option value="indoor" {{ $sport->sports_type == 'indoor' ? 'selected' : '' }}>Indoor</option>
                <option value="outdoor" {{ $sport->sports_type == 'outdoor' ? 'selected' : '' }}>Outdoor</option>
            </select>
        </div>

        <div class="flex space-x-4">
            <button type="submit" class="px-4 py-2 bg-green-500 text-white rounded shadow hover:bg-green-600">
                Update
            </button>
            <a href="{{ route('management.index') }}" class="px-4 py-2 bg-gray-500 text-white rounded shadow hover:bg-gray-600">
                Back to Management
            </a>
        </div>
    </form>
</div>

@endsection
