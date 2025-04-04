<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Layout')</title>

    <!-- Link to the CSS file in resources/css/app.css -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

    <!-- Wrapper should be a flex container -->
    <div class="flex flex-col flex-grow">
        @include('header.header')

        <div class="container mt-10 mx-auto px-4 flex-grow">
            @yield('content')
        </div>
    </div>

    <footer class="bg-gray-800 text-white text-center py-4 mt-auto">
        @include('footer.contact')
    </footer>

</body>
</html>
