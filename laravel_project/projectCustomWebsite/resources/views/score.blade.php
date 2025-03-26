@extends('layouts.layout')

@section('title', 'Score')

@section('content')
    <div class="max-w-4xl mx-auto p-6 bg-white shadow rounded">
        <!-- Dropdown Section -->
        <section class="mb-6">
            <h3 class="text-2xl font-bold mb-4">Select Sports & States</h3>
            <div class="flex space-x-4">
                <!-- Sport Dropdown -->
                <div class="w-1/2">
                    <label for="sport" class="block text-sm font-medium text-gray-700">Select Sport</label>
                    <select id="sport" name="sport" class="mt-1 block w-full p-2 border border-gray-300 rounded">
                        <option value="">-- Choose Sport --</option>
                        @include('form.sports_list') <!-- Include sports list -->
                    </select>
                </div>

                <!-- State Dropdown -->
                <div class="w-1/2">
                    <label for="state" class="block text-sm font-medium text-gray-700">Select State</label>
                    <select id="state" name="state" class="mt-1 block w-full p-2 border border-gray-300 rounded">
                        <option value="">-- Choose State --</option>
                        <option value="sarawak">Sarawak</option>
                        <option value="sabah">Sabah</option>
                        <option value="johor">Johor</option>
                        <option value="selangor">Selangor</option>
                    </select>
                </div>
            </div>
        </section>

        <!-- Table Section -->
        <section class="mb-6">
            <h3 class="text-2xl font-bold mb-4">Sports Performance</h3>
            <table class="w-full border-collapse border border-gray-300">
                <thead class="bg-gray-100">
                    <tr>
                        <th class="border border-gray-300 p-2">Sport</th>
                        <th class="border border-gray-300 p-2">State</th>
                        <th class="border border-gray-300 p-2">Wins</th>
                        <th class="border border-gray-300 p-2">Losses</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="border border-gray-300 p-2">Football</td>
                        <td class="border border-gray-300 p-2">Sarawak</td>
                        <td class="border border-gray-300 p-2">10</td>
                        <td class="border border-gray-300 p-2">2</td>
                    </tr>
                    <tr>
                        <td class="border border-gray-300 p-2">Basketball</td>
                        <td class="border border-gray-300 p-2">Sabah</td>
                        <td class="border border-gray-300 p-2">8</td>
                        <td class="border border-gray-300 p-2">4</td>
                    </tr>
                    <tr>
                        <td class="border border-gray-300 p-2">Badminton</td>
                        <td class="border border-gray-300 p-2">Johor</td>
                        <td class="border border-gray-300 p-2">12</td>
                        <td class="border border-gray-300 p-2">3</td>
                    </tr>
                    <tr>
                        <td class="border border-gray-300 p-2">Hockey</td>
                        <td class="border border-gray-300 p-2">Selangor</td>
                        <td class="border border-gray-300 p-2">7</td>
                        <td class="border border-gray-300 p-2">5</td>
                    </tr>
                </tbody>
            </table>
        </section>
    </div>
@endsection
