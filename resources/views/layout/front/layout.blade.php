<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>{{_i('page.title')}}</title>
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
    <link href="{{asset('css/app.css')}}" rel="stylesheet">
    </head>
    <body>
        <div class="flex-center position-ref full-height">
            @stack('content')
        </div>
    </body>
    <footer>
    <script src="{{asset('js/app.js')}}" ></script>
        @stack('js')
    </footer>
</html>
