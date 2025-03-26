<!-- resources/views/layouts/layout.blade.php -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Layout')</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

    @include('header.header')

    <div class="container mx-auto p-6">
        @yield('content')
    </div>

    {{-- Footer should be placed here --}}
    @include('footer.contact')
</body>
</html>

