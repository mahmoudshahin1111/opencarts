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
            <div class="form-group" v-for="option in category.options">
                    <input name="option['name']" v-model="option.name">
                    <textarea name="option['description']" v-model="option.name"></textarea>
                    <input name="option['price']" type="number" v-model="option.name">
                    <button v-on:click="deleteOption(option)">-</button>
            </div>
            <button v-on:click="newOption()">+</button>
        </div>
        <div class="modal-footer justify-content-between">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
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
