<?php $__env->startPush('content'); ?>
<section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1> <?php echo e(_i('text.admin.stores.select_store_title')); ?></h1>
            </div>
          </div>
        </div><!-- /.container-fluid -->
</section>
<section class="content">

      <!-- Default box -->
      <div id="stores" class="card card-solid">
        <div class="card-body pb-0">
          <div class="row d-flex align-items-stretch">


            <div class="col-12 col-sm-6 col-md-6 d-flex align-items-stretch" v-for="store in stores">
              <div class="card bg-light">
                  <div v-if="store.is_active" class="ribbon-wrapper">
                        <div class="ribbon bg-success">
                            <?php echo e(_i('text.admin.stores.open')); ?>

                              </div>
                  </div>
                  <div v-if="!store.is_active" class="ribbon-wrapper">
                        <div class="ribbon bg-danger">
                            <?php echo e(_i('text.admin.stores.close')); ?>

                              </div>
                  </div>
                <div class="card-header text-muted border-bottom-0">
                    <?php echo e(_i('text.admin.stores.store_name')); ?> :
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>{{store.name}} </b></h2>
                      <p class="text-muted text-sm"><b><?php echo e(_i('admin.layout.title')); ?>: </b> {{store.description}} </p>
                      <ul class="ml-4 mb-0 fa-ul text-muted">
                      <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span> ///</li>
                      <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>  <?php echo e(_i('text.admin.stores.created_at')); ?> #: {{store.updated_at}}</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                    <img v-bind:src="store.image" alt="" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="text-right">
                    <button v-bind:disabled="!store.is_active" class="btn btn-sm btn-primary">
                        <ion-icon name="appstore"></ion-icon> <a class="btn btn-sm" v-bind:href="store.controlPanelUrl"> <?php echo e(_i('text.admin.stores.select_store')); ?><a>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /.card -->
    </section>
    <!-- /.content -->
  </div>
<?php $__env->stopPush(); ?>
<?php $__env->startPush('js'); ?>
    <script>
        (()=>{
            let app = new Vue({
                el:'#stores',
                data:{
                    stores:[]
                },
                methods:{
                    getStores:function(){
                        axios({
                            method:'GET',
                            data:{"request":"get_all_stores"},
                            url:"<?php echo e(route('web.stores.all_stores')); ?>",
                        }).then(res=>{
                            this.stores = res.data.stores;
                        });
                    },
                    selectedStore:function(){

                    }
                },
                mounted:function(){
                    console.log('mounted');
                    this.getStores();
                },

            })
        })();
        </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layout.admin.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>