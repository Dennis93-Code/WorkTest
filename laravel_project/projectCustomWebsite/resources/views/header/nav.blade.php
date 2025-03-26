<!-- resources/views/header/nav.blade.php -->
<nav class="bg-white shadow-md py-2">
    <div class="container mx-auto px-4">
        <ul class="flex space-x-6">
            <li><a href="{{ url('/home') }}" class="text-blue-600 hover:text-blue-800">Home</a></li>
            <li><a href="{{ url('/about') }}" class="text-blue-600 hover:text-blue-800">About</a></li>
            <li><a href="{{ url('/members') }}" class="text-blue-600 hover:text-blue-800">Members</a></li>
            <li><a href="{{ url('/events') }}" class="text-blue-600 hover:text-blue-800">Events</a></li>
            <li><a href="{{ url('/score') }}" class="text-blue-600 hover:text-blue-800">Scoreboard</a></li>
        </ul>
    </div>
</nav>
