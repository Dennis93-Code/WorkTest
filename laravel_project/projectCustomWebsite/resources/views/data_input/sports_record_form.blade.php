@extends('layouts.layout')
@section('title', 'Record Sport')
@section('content')
    <div class="max-w-2xl mx-auto p-6 bg-white shadow rounded">
        <h3 class="text-2xl font-bold mb-4">Record a New Sport</h3>

        @if (session('success'))
            <div class="bg-green-200 text-green-700 p-2 rounded mb-4">
                {{ session('success') }}
            </div>
        @endif

        <form action="{{ route('sports.store') }}" method="POST">
            @csrf
            <label for="name" class="block text-sm font-medium text-gray-700">Sport Name</label>
            <input type="text" id="name" name="name" class="mt-1 block w-full p-2 border border-gray-300 rounded" required>

            <button type="submit" class="mt-4 px-4 py-2 bg-blue-500 text-white rounded">Save</button>
        </form>
    </div>
@endsection
