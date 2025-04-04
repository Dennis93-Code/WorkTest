@extends('layouts.layout')
@section('title', 'Record Sport')

@section('content')
    <div class="max-w-2xl mx-auto p-6 bg-white shadow rounded-md">
        <h3 class="text-2xl font-bold mb-4">Record a New Sport</h3>

        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        @if($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form action="{{ route('sports.store') }}" method="POST">
            @csrf
            <div class="mb-4">
                <label for="sports_name" class="block font-semibold mb-1">Sport Name</label>
                <input type="text" id="sports_name" name="sports_name" value="{{ old('sports_name') }}" class="w-full border border-black rounded-md p-2 bg-white @error('sports_name') border-red-500 @enderror" required>
                @error('sports_name')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

            <div class="mb-4">
                <label for="competition_type" class="block font-semibold mb-1">Competition Type</label>
                <select id="competition_type" name="competition_type" class="w-full border border-black rounded-md p-2 bg-white @error('competition_type') border-red-500 @enderror" required>
                    <option value="Team Match" {{ old('competition_type') == 'Team Match' ? 'selected' : '' }}>Team Match</option>
                    <option value="Last Man Standing" {{ old('competition_type') == 'Last Man Standing' ? 'selected' : '' }}>Last Man Standing</option>
                </select>
                @error('competition_type')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

            <div class="mb-4">
                <label for="description" class="block font-semibold mb-1">Sport Description</label>
                <textarea id="description" name="description" rows="3" class="w-full border border-black rounded-md p-2 bg-white @error('description') border-red-500 @enderror" required>{{ old('description') }}</textarea>
                @error('description')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

            <div class="mb-4">
                <label for="sports_type" class="block font-semibold mb-1">Sports Type</label>
                <select id="sports_type" name="sports_type" class="w-full border border-black rounded-md p-2 bg-white @error('sports_type') border-red-500 @enderror" required>
                    <option value="indoor" {{ old('sports_type') == 'indoor' ? 'selected' : '' }}>Indoor method</option>
                    <option value="outdoor" {{ old('sports_type') == 'outdoor' ? 'selected' : '' }}>Outdoor method</option>
                </select>
                @error('sports_type')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

            <button type="submit" class="w-full py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600">Save</button>
        </form>
    </div>
@endsection

@if(session('success'))
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // ✅ Show success popup
            Swal.fire({
                title: "Success!",
                text: "{{ session('success') }}",
                icon: "success",
                timer: 5000, // 5 seconds
                showConfirmButton: false
            });

            // ✅ Redirect after 5 seconds
            setTimeout(function () {
                window.location.href = "{{ route('management.index') }}";
            }, 5000);
        });
    </script>
@endif
