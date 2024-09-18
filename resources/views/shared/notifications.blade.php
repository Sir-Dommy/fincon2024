@if(session('success'))
    <div class="alert alert-success">
        <h4>Success.</h4><p>{{ session('success') }}</p>
    </div>
@endif

@if(session('info'))
    <div class="alert alert-info">
        <h4>Info.</h4><p>{{ session('info') }}</p>
    </div>
@endif