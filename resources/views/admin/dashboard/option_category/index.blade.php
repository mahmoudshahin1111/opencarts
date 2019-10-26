@extends('layout.admin.layout')
@push('content')
<div id="app">
    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title">@{{category.name}}</h3>
            <div class="card-tools">
                <span v-if="category.is_active == 1" v-on:click="category.is_active?category.is_active=0:category.is_active=1" class="badge badge-success">{{_i('Activated')}}</span>
                <span v-if="category.is_active == 0" v-on:click="category.is_active?category.is_active=0:category.is_active=1" class="badge badge-danger">{{_i('DeActivated')}}</span>
            </div>
        </div>
        <div class="card-body">
            {{-- Name --}}
            <div class="form-group">
                <label for="sonibeocbahg">{{_i('Name')}}</label>
                <input type="text" class="form-control" v-model="category.name" id="sonibeocbahg">
                <span style="color:#dc3545" v-if="errors.name">@{{errors.name[0]}}</span>
            </div>
            {{-- Description --}}
            <div class="form-group">
                <label for="sonibeocbahga">{{_i('Description')}}</label>
                <input type="text" class="form-control" v-model="category.description" id="sonibeocbahga">
                <span style="color:#dc3545" v-if="errors.description">@{{errors.description[0]}}</span>
            </div>
            {{-- Type Of --}}
            <div class="form-group clearfix">
                <div class="icheck-primary">
                    <input type="radio" id="R1" value="COLOR" name="type" v-model="category.code">
                    <label for="R1">
                            {{_i('Color Group')}}
                    </label>
                </div>
                <div class="icheck-primary">
                    <input type="radio" id="R2" value="NORMAL" name="type" v-model="category.code" checked>
                    <label for="R2">
                            {{_i('Normal')}}
                    </label>
                </div>
            </div>
            {{-- Image --}}
            <div v-if="category.id" class="form-group">
                    <span style="color:#dc3545" v-if="errors.image">@{{errors.image[0]}}</span>
            <label>
            <img class="profile-user-img img-fluid img-circle" v-bind:src="category.image?category.image.url:'{{config('defaults.default_user_images.profile_image')}}'">
                    <input type="file" v-on:change="uploadFile($event)" style="display:none">
            </label>
            <div class="progress progress-xs">
                    <div class="progress-bar bg-primary progress-bar-striped" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" :style="{width:progress+'%'}">
                    </div>
                  </div>
            </div>
        </div>
        {{-- Save --}}
        <div class="card-footer">
            <button type="submit" v-on:click="save()" class="btn btn-primary">{{_i('Save')}}</button>
            <button type="button" v-on:click="reset()" class="btn btn-primary">{{_i('New')}}</button>
        </div>
    </div>
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">{{_i('Categories')}}</h3>
        </div>
        {{-- Table --}}
        <div class="card-body">
            <table id="categories" class="table table-bordered table-hover">
            </table>
        </div>
        <!-- /.card-body -->
    </div>
    <!-- /.card -->
</div>
@endpush
@push('js')
<script>
    var basic_url = `{{route('option_category.index')}}`;
    let vue = new Vue({
        el: "#app",
        data: {
            url: basic_url,
            category: {
                is_active:0,
                code:'NORMAL'
            },
            file:null,
            errors:{},
            progress:0
        },
        methods: {
            getCategory: function(id) {
                axios.get(
                    `${basic_url}/${id}`,
                ).then(res => {
                    this.category = res.data;
                });
            },
            deleteCategory:function(id){
                axios.delete(
                    `${basic_url}/${id}`,
                ).then(res => {
                    this.reset();
                    refreshTable();
                });
            },
            uploadFile:function(){
                if(!event.target.files[0]) return;
this.file = event.target.files[0];
                let fd = new  FormData();
                let url = `{{route('web.option_category.upload')}}`;
                fd.append('image',this.file);
                fd.append('id',this.category.id);
                axios({
                    method:'POST',
                    'url':url,
                    data:fd,
                    onUploadProgress:(progressEvent)=>{
                        vue.progress = (progressEvent.loaded / progressEvent.total)*100;
                    }
                }).then(res => {
                    this.category['image']['url'] = res.data;
                    vue.progress = 0;
                    refreshTable();
                },(error)=>{
                        this.errors = error.response.data.errors;
                    });
            },
            // Save Option Category
            save: function() {
                if (this.category.id) {
                    // Update
                    axios.put(
                        `${basic_url}/${this.category.id}`,
                        this.category

                    ).then((res)=>{
                        this.reset();
                        refreshTable();
                        this.$toastr.s("SUCCESS MESSAGE", "{{_i('Saved')}}");
                    },(error)=>{
                        this.errors = error.response.data.errors;
                    });
                } else {
                    // Store
                    axios.post(
                        `${basic_url}`,
                        this.category
                    ).then(res => {
                        this.reset();
                        refreshTable();
                        this.$toastr.s("SUCCESS MESSAGE", "{{_i('Saved')}}");
                    },(error)=>{
                        this.errors = error.response.data.errors;
                    });
                }

            },
            reset: function() {
                this.category = {
                    is_active:0,
                    code:'NORMAL',
                    file:null
                };
                this.url = `{{route('option_category.index')}}`;
                this.errors = {};
            }
        },
    });
    let table = $('#categories').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        ajax: {
            url: "{{route('option_category.index')}}"
        },
        columns: [{
                title: "id",
                data: "id"
            },
            {
                title: "Name",
                data: "name"
            },
            {
                title: "Description",
                data: "description"
            },
            {
                title:'Image',
                data:"image",
                render:function(data,row,type,meta){
                    if(data){
                        return `<img alt="Avatar" class="profile-user-img img-fluid img-circle" src="${data.url}">`;
                    }else{
                        return `<img alt="Avatar" class="profile-user-img img-fluid img-circle" src="{{config('defaults.default_user_images.profile_image')}}">`;
                    }

                }
            },
             {
                title: "Activation",
                data: "is_active",
                render: function(active) {
                    if (active==1) {
                        return `<span class="badge bg-success">{{_i('Activated')}}</span>`;

                    } else {
                        return `<span class="badge bg-danger">{{_i('DeActivated')}}</span>`;
                    }
                }
            },
            {
                title: "",
                data: "id",
                render: function(data,row,type,meta) {
                    return `
                    <button class="btn btn-info btn-sm" onclick="getCategory(${data})">
                    <i class="fas fa-pencil-alt">
                    </i>{{_i('Edit')}}</button>
                    <button class="btn btn-danger btn-sm"  onclick="deleteCategory(${data})"><i class="fas fa-trash"></i>{{_i('Delete')}}</button>`;
                }
            }
        ]
    });
    function deleteCategory(id){
        vue.deleteCategory(id);
    }
    function getCategory(id) {
        vue.getCategory(id);
    }

    function refreshTable() {
        table.ajax.reload();
    }
</script>
@endpush
