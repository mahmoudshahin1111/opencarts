<?php $__env->startPush('content'); ?>
    <p><?php echo e(_i('text.admin.stores.about')); ?></p>
<?php $__env->stopPush(); ?>
<?php $__env->startPush('js'); ?>

<?php $__env->stopPush(); ?>

<?php echo $__env->make('layout.admin.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>