@extends('layouts.layout')
@section('title', 'Management')
@section('content')

<div class="max-w-4xl mx-auto p-6 bg-white shadow rounded">
    <h2 class="text-2xl font-bold mb-4">Management</h2>
    <p class="mb-4">Manage sports records and other related data from here.</p>

    <a href="{{ route('sports.create') }}" class="px-4 py-2 bg-blue-500 text-white rounded">
        Create New Sport Record
    </a>

    <!-- ✅ Flash message for success -->
    @if(session('success'))
        <div class="mt-4 p-3 bg-green-500 text-white rounded">
            {{ session('success') }}
        </div>
    @endif

    <!-- ✅ Display Sports List -->
    <div class="mt-6">
        <table class="min-w-full border-collapse border border-gray-300">
            <thead>
                <tr class="bg-gray-100">
                    <th class="border border-gray-300 px-4 py-2">ID</th>
                    <th class="border border-gray-300 px-4 py-2">Sport Name</th>
                    <th class="border border-gray-300 px-4 py-2">Competition Type</th>
                    <th class="border border-gray-300 px-4 py-2">Sports Type</th>
                    <th class="border border-gray-300 px-4 py-2">Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach($sports as $sport)
                <tr>
                    <td class="border border-gray-300 px-4 py-2">{{ $sport->id }}</td>
                    <td class="border border-gray-300 px-4 py-2">{{ $sport->sports_name }}</td>
                    <td class="border border-gray-300 px-4 py-2">{{ $sport->competition_type }}</td>
                    <td class="border border-gray-300 px-4 py-2">{{ $sport->sports_type }}</td>
                    <td class="border border-gray-300 px-4 py-2">
                        <!-- ✅ Edit Button -->
                        <a href="{{ route('sports.edit', $sport->id) }}"
                           class="px-4 py-2 bg-yellow-500 text-white rounded">
                            Edit
                        </a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

@endsection
