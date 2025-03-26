@extends('layouts.layout')

@section('title', 'Members')

@section('content')
    <div class="max-w-6xl mx-auto p-6 bg-white shadow rounded">
        <!-- Dropdown Section -->
        <section class="mb-6">
            <h3 class="text-2xl font-bold mb-4">Filter Members</h3>
            <div class="flex space-x-4">
                <!-- Member Type Dropdown -->
                <div class="w-1/3">
                    <label for="member_type" class="block text-sm font-medium text-gray-700">Select Member Type</label>
                    <select id="member_type" name="member_type" class="mt-1 block w-full p-2 border border-gray-300 rounded">
                        <option value="">All Members</option>
                        <option value="athlete">Athletes</option>
                        <option value="staff">Staff</option>
                        <option value="client">Clients</option>
                    </select>
                </div>
            </div>
        </section>

        <!-- Members Display Section -->
        <section class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <!-- Sample Athlete Card -->
            <div class="bg-gray-100 p-4 rounded shadow">
                <h4 class="text-lg font-bold text-gray-800">John Doe</h4>
                <p class="text-gray-700">🏅 Athlete | Football</p>
                <p class="text-gray-700">Performance Score: <span class="font-bold">92%</span></p>
                <p class="text-gray-700">Matches Played: 20</p>
                <p class="text-gray-700">Coach Rating: 4.5/5</p>
                <div class="mt-4">
                    <a href="#" class="text-blue-500">View Details</a>
                </div>
            </div>

            <!-- Sample Staff Card -->
            <div class="bg-gray-100 p-4 rounded shadow">
                <h4 class="text-lg font-bold text-gray-800">Jane Smith</h4>
                <p class="text-gray-700">👨‍💼 Staff | Coach</p>
                <p class="text-gray-700">Workload Score: <span class="font-bold">85%</span></p>
                <p class="text-gray-700">Daily Tasks: Training Sessions</p>
                <p class="text-gray-700">Department: Football</p>
                <div class="mt-4">
                    <a href="#" class="text-blue-500">View Details</a>
                </div>
            </div>

            <!-- Sample Client Card -->
            <div class="bg-gray-100 p-4 rounded shadow">
                <h4 class="text-lg font-bold text-gray-800">Michael Lee</h4>
                <p class="text-gray-700">📺 Client | Viewer</p>
                <p class="text-gray-700">Total Views: 15</p>
                <p class="text-gray-700">Most Watched Video: <span class="font-bold">Finals 2024</span></p>
                <p class="text-gray-700">Viewing Time: 2h 30m</p>
                <div class="mt-4">
                    <a href="#" class="text-blue-500">View Details</a>
                </div>
            </div>
        </section>
    </div>
@endsection
