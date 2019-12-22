<?php

namespace App\Providers;

use App\models\ProductCategory;
use Illuminate\Support\ServiceProvider;
use App\Observers\ProductCategoryObserver;

class RegisterProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
         ProductCategory::observe(ProductCategoryObserver::class);
    }
}
