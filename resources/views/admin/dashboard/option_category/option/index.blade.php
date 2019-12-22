 <!-- /.modal -->
 <div class="modal fade" id="modal-xl">
     <div class="modal-dialog modal-xl">
         <div class="modal-content">
             <div class="modal-header">
                 <h4 class="modal-title">{{_i('Option To Category')}} @{{category.name}}</h4>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                 </button>
             </div>
             <div class="modal-body">
                 <div class="row">
                     <div class="col-md-10">
                         <div class="form-group" v-for="option in category.options">
                             <input class="form-control" name="option[]['name']" v-model="option.name">
                             <vue-editor v-model="option.description"></vue-editor>
                             <input name="option[]['price']['value']" type="number" step="0.01" class="form-control" v-model="option['price']['value']">
                             <a class="btn btn-danger btn-sm" v-on:click="deleteOption(option)" href="#">
                                 <i class="fas fa-trash"></i>Delete</a>
                         </div>
                     </div>
                     <div class="col-md-2">
                         <ion-icon v-on:click="newOption()" name="add"></ion-icon>
                     </div>
                 </div>
             </div>
             <div class="modal-footer justify-content-between">
                 <button type="button" class="btn btn-default" data-dismiss="modal">{{_i('Close')}}</button>
             </div>
         </div>
         <!-- /.modal-content -->
     </div>
     <!-- /.modal-dialog -->
 </div>
 <!-- /.modal -->
 @push('js')
 <script>

 </script>
 @endpush
