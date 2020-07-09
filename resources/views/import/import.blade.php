<div class="text-center ">
    <form class="col-xl-6" action='{{ route('import.student') }}' enctype='multipart/form-data' method='POST'>
        @csrf
        <div class="form-group text-center">
            <label for="file">Upload File</label>
            <input class="form-control" type='file' name='file_excel' required='true'>
        </div>
        <div class="form-group">
            <button type='submit' class="btn btn-success">Upload File Excel</button>
        </div>
    </form>
</div>

