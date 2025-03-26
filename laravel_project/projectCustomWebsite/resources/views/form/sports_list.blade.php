<!-- resources/views/form/sports_list.blade.php -->
<!-- strtolower means string to lower for all list of sports -->
@php
    $sports = ['Football', 'Basketball', 'Badminton', 'Hockey', 'VolleyBall'];
@endphp

@foreach ($sports as $sport)
    <option value="{{ strtolower($sport) }}">{{ $sport }}</option>
@endforeach
