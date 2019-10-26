<!DOCTYPE html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title><?php echo e(_i('page.title')); ?></title>
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
    <link href="<?php echo e(asset('css/app.css')); ?>" rel="stylesheet">
    </head>
    <body>
        <div class="flex-center position-ref full-height">
            <?php echo $__env->yieldPushContent('content'); ?>
        </div>
    </body>
    <footer>
    <script src="<?php echo e(asset('js/app.js')); ?>" ></script>
        <?php echo $__env->yieldPushContent('js'); ?>
    </footer>
</html>
