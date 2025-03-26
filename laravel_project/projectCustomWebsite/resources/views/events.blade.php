@extends('layouts.layout')

@section('title', 'Events')

@section('content')
    <div class="max-w-6xl mx-auto p-6 bg-white shadow rounded">
        <!-- Dropdown Section -->
        <section class="mb-6">
            <h3 class="text-2xl font-bold mb-4">Select Sport & Location</h3>
            <div class="flex space-x-4">
                <!-- Sport Dropdown -->
                <div class="w-1/3">
                    <label for="sport" class="block text-sm font-medium text-gray-700">Select Sport</label>
                    <select id="sport" name="sport" class="mt-1 block w-full p-2 border border-gray-300 rounded">
                        <option value="">All Sports</option>
                        <option value="football">Football</option>
                        <option value="basketball">Basketball</option>
                        <option value="badminton">Badminton</option>
                        <option value="hockey">Hockey</option>
                    </select>
                </div>

                <!-- Country Dropdown -->
                <div class="w-1/3">
                    <label for="country" class="block text-sm font-medium text-gray-700">Select Country</label>
                    <select id="country" name="country" class="mt-1 block w-full p-2 border border-gray-300 rounded">
                        <option value="">Malaysia</option>
                        <option value="singapore">Singapore</option>
                        <option value="indonesia">Indonesia</option>
                    </select>
                </div>

                <!-- State Dropdown -->
                <div class="w-1/3">
                    <label for="state" class="block text-sm font-medium text-gray-700">Select State</label>
                    <select id="state" name="state" class="mt-1 block w-full p-2 border border-gray-300 rounded">
                        <option value="">All States</option>
                        <option value="sarawak">Sarawak</option>
                        <option value="sabah">Sabah</option>
                        <option value="johor">Johor</option>
                        <option value="selangor">Selangor</option>
                    </select>
                </div>
            </div>
        </section>

        <!-- IN THIS SECTION, ALL THE SELECTED DROPDOWN WOULD ONLY SHOW SPECIFIC CARDS INVOLVED.-->
        <!-- Those data card below would only show specific condition in laravel code instead of static, it would
        change into the card band on data involved. Currently it is all raw static information for now.-->
        <!-- Event Cards Section -->
        <section class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <!-- Sample Event Card -->
            <div class="bg-gray-100 p-4 rounded shadow">
                <h4 class="text-lg font-bold text-gray-800">KAMPAR</h4>
                <img src="https://via.placeholder.com/100" class="mx-auto my-2 rounded-full" alt="Event Image">
                <p class="text-gray-700 font-bold">Jul 13, 2024 (Saturday)</p>
                <p class="text-gray-900 font-bold">GLOW Night 5km Fun Run</p>
                <p class="text-gray-700">UTAR Kampar</p>
                <div class="flex justify-between mt-4">
                    <a href="#" class="text-blue-500">Find out more</a>
                    <span class="bg-red-500 text-white px-3 py-1 text-sm rounded">Closed</span>
                </div>
            </div>

            <!-- Sample Event Card -->
            <div class="bg-gray-100 p-4 rounded shadow">
                <h4 class="text-lg font-bold text-gray-800">BATU KAWAN</h4>
                <img src="https://via.placeholder.com/100" class="mx-auto my-2 rounded-full" alt="Event Image">
                <p class="text-gray-700 font-bold">Jul 7, 2024 (Sunday)</p>
                <p class="text-gray-900 font-bold">Himalaya Sports Penang Half Marathon</p>
                <p class="text-gray-700">Stadium Negeri Pulau Pinang</p>
                <p class="text-gray-700">RM55 - RM140</p>
                <div class="flex justify-between mt-4">
                    <a href="#" class="text-blue-500">Find out more</a>
                    <span class="bg-red-500 text-white px-3 py-1 text-sm rounded">Closed</span>
                </div>
            </div>

            <!-- Sample Event Card -->
            <div class="bg-gray-100 p-4 rounded shadow">
                <h4 class="text-lg font-bold text-gray-800">ARAU</h4>
                <img src="https://via.placeholder.com/100" class="mx-auto my-2 rounded-full" alt="Event Image">
                <p class="text-gray-700 font-bold">Jun 22, 2024 (Saturday)</p>
                <p class="text-gray-900 font-bold">HARUMANIS TRAIL RUN 2024</p>
                <p class="text-gray-700">Pusat Sukan & Rekreasi UniMAP</p>
                <div class="flex justify-between mt-4">
                    <a href="#" class="text-blue-500">Find out more</a>
                    <span class="bg-red-500 text-white px-3 py-1 text-sm rounded">Closed</span>
                </div>
            </div>
        </section>
    </div>
@endsection
