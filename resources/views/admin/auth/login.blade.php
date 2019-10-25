@extends('layout.admin_out_layout.layout')
@push('content')
<div class="login-box">
        <div class="login-logo">
        <a href="{{route('web.login')}}"><b>Admin</b>LTE</a>
        </div>
        <!-- /.login-logo -->
        <div class="card">
          <div class="card-body login-card-body">
            <p class="login-box-msg">{{trans('Sign in to start your session')}}</p>
            @if(session()->has('error'))
            <div class="alert alert-danger alert-dismissible">

                 
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <h5><i class="icon fas fa-ban"></i>{{session('error.title')}}</h5>
                  {{session('error.message')}}
                </div>  
            @endif
          <form action="{{route('web.login')}}" method="post">
            @csrf
              <div class="input-group mb-3">
              <input type="email" name="email" value="{{old('email')}}" class="form-control" placeholder="{{trans('Email')}}">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <span class="fas fa-envelope"></span>
                  </div>
                </div>
              </div>
              
              <div class="input-group mb-3">
                <input type="password" name="password" minlength="3" maxlength="28" class="form-control" placeholder="{{trans('Password')}}">
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
                            {{trans('Remember Me')}}
                    </label>
                  </div>
                </div>
                <!-- /.col -->
                <div class="col-4">
                  <button type="submit" class="btn btn-primary btn-block btn-flat">{{trans('Sign In')}}</button>
                </div>
                <!-- /.col -->
              </div>
            </form>
      
            <div class="social-auth-links text-center mb-3">
              <p>- OR -</p>
              <a href="#" class="btn btn-block btn-primary">
                <i class="fab fa-facebook mr-2"></i> {{trans('Sign in using Facebook')}}
              </a>
              <a href="#" class="btn btn-block btn-danger">
                <i class="fab fa-google-plus mr-2"></i> {{trans('Sign in using Google+')}}
              </a>
            </div>
            <!-- /.social-auth-links -->
      
            <p class="mb-1">
              <a href="#">{{trans('I forgot my password')}}</a>
            </p>
            <p class="mb-0">
              <a href="register.html" class="text-center">{{trans('Register a new membership')}}</a>
            </p>
          </div>
          <!-- /.login-card-body -->
        </div>
      </div>
      <!-- /.login-box -->
@endpush
@push('js')
@endpush

