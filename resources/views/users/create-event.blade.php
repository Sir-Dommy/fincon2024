@extends('layouts.business')

@section('title', 'Create Event')

@section('content')
<div class="jumbotron jumbotron-fluid bg-white">
    <div class="container">
      <div class="row">
          <div class="col-md-12">
              <h3>Create Event</h3>
          </div>
      </div>
    </div>
</div>


<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-8 col-sm-12">

            <div class="card card-default">
                <div class="card-body">
                    @include('shared.notifications')
                    
                    <form action="{{ route('events.store') }}" method="POST" enctype="multipart/form-data">
                        {{ csrf_field() }}

                        <div class="form-row">
                            <div class="form-group col-md-8 col-lg-8 col-sm-12 {{ $errors->has('title') ? ' has-error' : '' }}">
                                <label for="title">Title*</label>
                                <input type="text" class="form-control" name="title" value="{{ old('title') }}" autofocus="autofocus">
                                @if ($errors->has('title'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('title') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-4 col-lg-4 col-sm-12 {{ $errors->has('organizer_id') ? ' has-error' : '' }}">
                                <label for="organizer_id">Organized By</label>
                                <select class="form-control" name="organizer_id">
                                    @foreach($organizers as $organizer)
                                    <option value="{{ $organizer->id }}">{{ $organizer->name }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('organizer_id'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('organizer_id') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6 col-lg-6 col-sm-12 {{ $errors->has('category_id') ? ' has-error' : '' }}">
                                <label for="category_id">Category</label>
                                <select class="form-control" name="category_id">
                                    <option value="">Select</option>
                                    @foreach($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('category_id'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('category_id') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-6 col-lg-6 col-sm-12 {{ $errors->has('event_type_id') ? ' has-error' : '' }}">
                                <label for="event_type_id">Event Type</label>
                                <select class="form-control" name="event_type_id">
                                    <option value="">Select</option>
                                    @foreach($eventtypes as $eventtype)
                                    <option value="{{ $eventtype->id }}">{{ $eventtype->name }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('event_type_id'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('event_type_id') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-6 col-lg-6 col-sm-12 {{ $errors->has('venue') ? ' has-error' : '' }}">
                                <label for="venue">Venue</label>
                                <input type="text" name="venue" class="form-control" value="{{ old('venue') }}">
                                @if ($errors->has('venue'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('venue') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-6 col-lg-6 col-sm-12 {{ $errors->has('location') ? ' has-error' : '' }}">
                                <label for="location">Location</label>
                                <input type="text" name="location" class="form-control" value="{{ old('location') }}">
                                @if ($errors->has('location'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('location') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <!--<div class="form-group">
                            <label for="address_address">Address</label>
                            <input type="text" id="address-input" name="address_address" class="form-control map-input">
                            <input type="hidden" name="address_latitude" id="address-latitude" value="0" />
                            <input type="hidden" name="address_longitude" id="address-longitude" value="0" />
                        </div>
                        <div id="address-map-container" style="width:100%;height:200px; ">
                            <div style="width: 100%; height: 100%" id="address-map"></div>
                        </div>-->
                        <div class="form-row">
                            <div class="form-group col-md-3 col-lg-3 col-sm-12 {{ $errors->has('from_date') ? ' has-error' : '' }}">
                                <label for="from_date">Start Date</label>
                                <input type="date" class="form-control" name="from_date" value="{{ old('from_date') }}">
                                @if ($errors->has('from_date'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('from_date') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-3 col-lg-3 col-sm-12 {{ $errors->has('start_time') ? ' has-error' : '' }}">
                                <label for="start_time">Start Time</label>
                                <input type="time" class="form-control" name="start_time" value="{{ old('start_time') }}">
                                @if ($errors->has('start_time'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('start_time') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-3 col-lg-3 col-sm-12 {{ $errors->has('to_date') ? ' has-error' : '' }}">
                                <label for="to_date">End Date</label>
                                <input type="date" class="form-control" name="to_date" value="{{ old('to_date') }}">
                                @if ($errors->has('to_date'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('to_date') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-3 col-lg-3 col-sm-12 {{ $errors->has('end_time') ? ' has-error' : '' }}">
                                <label for="end_time">End Time</label>
                                <input type="time" class="form-control" name="end_time" value="{{ old('end_time') }}">
                                @if ($errors->has('end_time'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('end_time') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group {{ $errors->has('website') ? ' has-error' : '' }}">
                            <label for="website">Website</label>
                            <input type="text" class="form-control" name="website" value="{{ old('website') }}" autofocus="autofocus">
                            @if ($errors->has('website'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('website') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('short_desc') ? ' has-error' : '' }}">
                            <label for="short_desc">Short Description</label>
                            <textarea name="short_desc" rows="10" class="form-control">{{ old('short_desc') }}</textarea>
                            @if ($errors->has('short_desc'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('short_desc') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('long_desc') ? ' has-error' : '' }}">
                            <label for="long_desc">Long Description</label>
                            <textarea name="long_desc" rows="20" class="form-control">{{ old('long_desc') }}</textarea>
                            @if ($errors->has('long_desc'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('long_desc') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('cover_img') ? ' has-error' : '' }}">
                            <label for="cover_img">Cover Image</label>
                            <input type="file" class="form-control" name="image" value="{{ old('image') }}">
                            @if ($errors->has('logo'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('cover_img') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-lg-4 col-sm-12">
            <div class="card bg-light">
                <div class="card-body">
                    <h4>COMMON QUESTIONS</h4>
                    <strong>Why do I need Organized By</strong>
                    <p>Organized By helps you utilize our event management tools. This includes email invitations and reminders.</p>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('scripts')
    @parent
    <script src="https://maps.googleapis.com/maps/api/js?key={{ env('GOOGLE_MAPS_API_KEY') }}&libraries=places&callback=initialize" async defer></script>
    <script src="/js/mapInput.js"></script>
@stop
