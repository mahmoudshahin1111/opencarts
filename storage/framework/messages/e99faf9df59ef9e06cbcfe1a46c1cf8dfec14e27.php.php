<!DOCTYPE html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo e(_i('text.admin.layout.app_title')); ?></title>
    <!-- Fonts -->
    <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
    <link href="<?php echo e(asset('css/app.css')); ?>" rel="stylesheet">
</head>

<body class="hold-transition layout-top-nav">
    <div class="wrapper">
        <?php echo $__env->make('layout.admin.top_nav', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        
        <div class="content-wrapper">
                <div class="content">
                        <div class="container">
            <?php echo $__env->yieldPushContent('content'); ?>
                        </div>
                </div>
        </div>
        <footer class="main-footer">
            <?php echo $__env->make('layout.admin.footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <script src="<?php echo e(asset('js/app.js')); ?>"></script>
            <?php echo $__env->yieldPushContent('js'); ?>
        </footer>
    </div>
</body>

</html>
