<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>{{trans('admin.layout.app_title')}}</title>
    <!-- Fonts -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
    <link href="{{asset('css/app.css')}}" rel="stylesheet">
</head>

<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
        @include('layout.admin_in_layout.top_nav')
        @include('layout.admin_in_layout.side_nav')
        <div class="content-wrapper">

                <section class="content">

                        <div class="container-fluid">

            @stack('content')
                        </div>
                </section>
        </div>
        <footer class="main-footer">
            @include('layout.admin_in_layout.footer')
            <script src="{{asset('js/app.js')}}"></script>
            @stack('js')
        </footer>
    </div>
</body>

</html>
