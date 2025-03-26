<!-- resources/views/home.blade.php -->
@extends('layouts.layout')

@section('title', 'Home')

@section('content')
    <div>
        <h1 class="text-2xl font-bold mb-4">Recent Sports in Malaysia</h1>
        <section class="mb-6">
            <h2 class="text-xl font-semibold">Football</h2>
            <p class="text-gray-700">Football in Malaysia has seen significant development...</p>
        </section>
        <section class="mb-6">
            <h2 class="text-xl font-semibold">Basketball</h2>
            <p class="text-gray-700">Basketball has also gained popularity in Malaysia...</p>
        </section>
        <section>
            <h2 class="text-xl font-semibold">Other Sports</h2>
            <p class="text-gray-700">Aside from football and basketball, Malaysia has a rich history...</p>
        </section>
    </div>
@endsection
