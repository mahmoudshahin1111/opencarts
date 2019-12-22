<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
<title>{{_i('text.admin.layout.app_title')}}</title>
    <!-- Fonts -->
    <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
    <link href="{{asset('css/app.css')}}" rel="stylesheet">
</head>

<body class="hold-transition layout-top-nav">
    <div class="wrapper">
        @include('layout.admin.top_nav')
        {{-- @include('layout.admin.side_nav') --}}
        <div class="content-wrapper">
                <div class="content">
                        <div class="container">
            @stack('content')
                        </div>
                </div>
        </div>
        <footer class="main-footer">
            @include('layout.admin.footer')
            <script src="{{asset('js/app.js')}}"></script>
            @stack('js')
        </footer>
    </div>
    <script>
       let nav_vue =  new Vue({
            el:"#nav_notification",
            data:{
                item_action:0
            },
            methods:{
                updateNotificationCounts($data){
                    this.item_action+=1;
                }
            }
        });
        </script>
</body>

</html>
