@extends('layout.admin_in_layout.layout')
@push('content')
<section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Select Store For Working on</h1>
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
                                Open
                              </div>
                  </div>
                  <div v-if="!store.is_active" class="ribbon-wrapper">
                        <div class="ribbon bg-danger">
                                Closed
                              </div>
                  </div>
                <div class="card-header text-muted border-bottom-0">
                        {{trans('Store Name')}} :
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>@{{store.name}} </b></h2>
                      <p class="text-muted text-sm"><b>@lang('admin.layout.title'): </b> @{{store.description}} </p>
                      <ul class="ml-4 mb-0 fa-ul text-muted">
                      <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span> ///</li>
                      <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> @lang('Created') At #: @{{store.updated_at}}</li>
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
                    <i class="fas fa-user"></i> <a  v-bind:href="store.controlPanelUrl">Select<a>
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
@endpush
@push('js')
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
                            url:"{{route('web.stores.all_stores')}}",
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
@endpush
