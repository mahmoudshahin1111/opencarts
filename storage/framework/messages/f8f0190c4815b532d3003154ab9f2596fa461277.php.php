<?php $__env->startPush('content'); ?>
<div class="login-box">
        <div class="login-logo">
        <a href="<?php echo e(route('web.login')); ?>"><b>Admin</b>LTE</a>
        </div>
        <!-- /.login-logo -->
        <div class="card">
          <div class="card-body login-card-body">
            <p class="login-box-msg"><?php echo e(_i('Sign in to start your session')); ?></p>
            <?php if(session()->has('error')): ?>
            <div class="alert alert-danger alert-dismissible">


                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <h5><i class="icon fas fa-ban"></i><?php echo e(session('error.title')); ?></h5>
                  <?php echo e(session('error.message')); ?>

                </div>
            <?php endif; ?>
          <form action="<?php echo e(route('web.login')); ?>" method="post">
            <?php echo csrf_field(); ?>
              <div class="input-group mb-3">
              <input type="email" name="email" value="<?php echo e(old('email')); ?>" class="form-control" placeholder="<?php echo e(_i('Email')); ?>">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fas fa-envelope"></span>
                  </div>
                </div>
              </div>

              <div class="input-group mb-3">
                <input type="password" name="password" minlength="3" maxlength="28" class="form-control" placeholder="<?php echo e(_i('Password')); ?>">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fas fa-lock"></span>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-8">
                  <div class="icheck-primary">
                    <input type="checkbox" id="remember">
                    <label for="remember">
                            <?php echo e(_i('Remember Me')); ?>

                    </label>
                  </div>
                </div>
                <!-- /.col -->
                <div class="col-4">
                  <button type="submit" class="btn btn-primary btn-block btn-flat"><?php echo e(_i('Sign In')); ?></button>
                </div>
                <!-- /.col -->
              </div>
            </form>

            <div class="social-auth-links text-center mb-3">
              <p>- OR -</p>
              <a href="#" class="btn btn-block btn-primary">
                <i class="fab fa-facebook mr-2"></i> <?php echo e(_i('Sign in using Facebook')); ?>

              </a>
              <a href="#" class="btn btn-block btn-danger">
                <i class="fab fa-google-plus mr-2"></i> <?php echo e(_i('Sign in using Google+')); ?>

              </a>
            </div>
            <!-- /.social-auth-links -->

            <p class="mb-1">
              <a href="#"><?php echo e(_i('I forgot my password')); ?></a>
            </p>
            <p class="mb-0">
              <a href="register.html" class="text-center"><?php echo e(_i('Register a new membership')); ?></a>
            </p>
          </div>
          <!-- /.login-card-body -->
        </div>
      </div>
      <!-- /.login-box -->
<?php $__env->stopPush(); ?>
<?php $__env->startPush('js'); ?>
<?php $__env->stopPush(); ?>


<?php echo $__env->make('layout.admin.isolated.login', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>