<div class="jumbotron jumbotron-fluid bg-danger mb-5">
  <div class="container">
    <div class="row">
        <div class="col-md-12">
            <form class="search-pros-form" action="{{ route('events.search') }}" method="post">
              {{ csrf_field() }}
                <div class="input-group">
                    <input type="text" name="search" aria-label="service" placeholder="Search events" class="form-control form-control-lg">
                    <input type="text" name="city" aria-label="location" placeholder="City?" class="form-control form-control-lg">
          
                    <div class="input-group-prepend">
                        <button type="submit" class="btn btn-primary btn-lg">Search</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
  </div>
</div>