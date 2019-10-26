<?php $__env->startPush('content'); ?>
<p><?php echo e(route('web.front')); ?></p>
<?php $__env->stopPush(); ?>
<?php $__env->startPush('js'); ?>

<?php $__env->stopPush(); ?>

<?php echo $__env->make('layout.front_layout.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>