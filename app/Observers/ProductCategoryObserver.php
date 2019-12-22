<?php

namespace App\Observers;

use App\Events\ProductCategoryAction;
use App\models\ProductCategory;



class ProductCategoryObserver
{
    /**
     * Handle the product category "created" event.
     *
     * @param  \App\ProductCategory  $productCategory
     * @return void
     */
    public function created(ProductCategory $productCategory)
    {
        broadcast(new ProductCategoryAction($productCategory))->toOthers();
    }

    /**
     * Handle the product category "updated" event.
     *
     * @param  \App\ProductCategory  $productCategory
     * @return void
     */
    public function updated(ProductCategory $productCategory)
    {
        broadcast(new ProductCategoryAction($productCategory))->toOthers();
    }

    /**
     * Handle the product category "deleted" event.
     *
     * @param  \App\ProductCategory  $productCategory
     * @return void
     */
    public function deleted(ProductCategory $productCategory)
    {
        broadcast(new ProductCategoryAction($productCategory))->toOthers();
    }

    /**
     * Handle the product category "restored" event.
     *
     * @param  \App\ProductCategory  $productCategory
     * @return void
     */
    public function restored(ProductCategory $productCategory)
    {
        broadcast(new ProductCategoryAction($productCategory))->toOthers();
    }

    /**
     * Handle the product category "force deleted" event.
     *
     * @param  \App\ProductCategory  $productCategory
     * @return void
     */
    public function forceDeleted(ProductCategory $productCategory)
    {
        broadcast(new ProductCategoryAction($productCategory));
    }
}
