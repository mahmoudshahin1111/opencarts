<?php $__env->startPush('content'); ?>
<div id="app">
<div v-if="category" class="card">
    <div class="card-header">
    <h3 class="card-title">{{category.name}}</h3>
        <div class="card-tools">
            <!-- Buttons, labels, and many other things can be placed here! -->
            <!-- Here is a label for example -->
            <span v-if="category.is_active" class="badge badge-success"><?php echo e(_i('Activated')); ?></span>
            <span v-if="!category.is_active" class="badge badge-danger"><?php echo e(_i('DeActivated')); ?></span>
        </div>
        <!-- /.card-tools -->
    </div>
    <!-- /.card-header -->
    <div class="card-body">
            <div class="form-group">
                    <label for="sonibeocbahg"><?php echo e(_i('Name')); ?></label>
                    <input type="email" class="form-control" v-model="category.name" id="sonibeocbahg">
                  </div>
                  <div class="form-group">
                        <label for="sonibeocbahga"><?php echo e(_i('Description')); ?></label>
                        <input type="email" class="form-control" v-model="category.description" id="sonibeocbahga">
                      </div>
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
            <button type="submit" class="btn btn-primary">Save</button>
    </div>
    <!-- /.card-footer -->
</div>
<!-- /.card -->
<div class="card">
    <div class="card-header">
        <h3 class="card-title">Categories</h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <table id="categories" class="table table-bordered table-hover">
        </table>
    </div>
    <!-- /.card-body -->
</div>
<!-- /.card -->
</div>
<?php $__env->stopPush(); ?>
<?php $__env->startPush('js'); ?>
<script>
    let vue = new Vue({
        el:"#app",
        data:{
            category:null,
        },methods: {
            updateCategory:function(id){
                axios({
                    method:"GET",
                    url:`<?php echo e(route('option_category.index')); ?>/${id}`,
                }).then(res=>{
                    this.category = res.data;
                });
            }
        },
    });
    $('#categories').DataTable({
        "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
        ajax:{
            url:"<?php echo e(route('option_category.index')); ?>"
        },
        columns: [{
                title: "id",
                data:"id"
            },
            {
                title: "Name",
                data:"name"
            },
            {
                title: "Description",
                data:"description"
            },{
                title:"Activation",
                data:"is_active",
                render:function(active){
                    if(active){
                        return `<span class="badge bg-success"><?php echo e(_i('Activated')); ?></span>`;
                    }else{
                        return `<span class="badge bg-danger"><?php echo e(_i('DeActivated')); ?></span>`;
                    }
                }
            },
            {
                title:"",
                data:"id",
                render:function(id){
                    return `
                    <a class="btn btn-info btn-sm" href="#" onclick="getCategory(${id})">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
                          </a>
                          `
                }
            }
        ]
    });
    function getCategory(id){
        vue.updateCategory(id);
    }
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layout.admin.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>