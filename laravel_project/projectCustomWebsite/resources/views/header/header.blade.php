<header class="bg-blue-600 text-white p-4 flex justify-between items-center">
    <div class="flex items-center space-x-4">
        <img src="{{ asset('images/cw-sports-2024-logo-png_seeklogo-524117.png') }}" alt="Sports Logo" class="h-12">
        <span class="text-xl font-bold">Sports and E-Sports Gaming Society</span>
    </div>
    <div class="relative">
        <div class="flex items-center space-x-4">
            <img id="profile-img" src="{{ asset('images/techprofile.jpg') }}" alt="Profile" class="w-10 h-10 rounded-full cursor-pointer">
        </div>
        <div id="settings-dropdown" class="hidden absolute right-0 mt-2 w-48 bg-white text-black shadow-lg rounded z-50 border border-gray-300">
            <a href="#" class="block px-4 py-2 hover:bg-gray-200">My Profile</a>
            <a href="#" class="block px-4 py-2 hover:bg-gray-200">Customize</a>
            <a href="#" class="block px-4 py-2 text-red-600 hover:bg-gray-200">Logout</a>
        </div>
    </div>
</header>
@include('header.nav')

<script>
    document.addEventListener('DOMContentLoaded', function () {
        console.log("JavaScript Loaded ✅");

        const profileImg = document.getElementById('profile-img');
        const settingsDropdown = document.getElementById('settings-dropdown');

        if (!profileImg || !settingsDropdown) {
            console.error("Error: Elements not found! ❌");
            return;
        }

        profileImg.addEventListener('click', function (event) {
            event.stopPropagation();
            console.log("Profile image clicked 🖱️");
            settingsDropdown.classList.toggle('hidden');
        });

        document.addEventListener('click', function (event) {
            if (!profileImg.contains(event.target) && !settingsDropdown.contains(event.target)) {
                console.log("Clicked outside dropdown, hiding it ⬆️");
                settingsDropdown.classList.add('hidden');
            }
        });
    });
</script>
