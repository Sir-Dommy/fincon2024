@extends('layouts.admin')

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">

            <div class="card card-default">
                <div class="card-header d-flex justify-content-between">
                  <h4>Edit Event - {{ $event->title }}</h4>
                  <a href="{{ route('admin.events.index') }}" class="btn btn-secondary">Back</a>
                </div>
                <div class="card-body">
                    <form action="{{ route('admin.events.update', $event) }}" method="POST" enctype="multipart/form-data">
                        {{ csrf_field() }}
                        <input type="hidden" name="_method" value="patch">

                        <div class="form-group {{ $errors->has('title') ? ' has-error' : '' }}">
                            <label for="title">Title*</label>
                            <input type="text" class="form-control" name="title" value="{{ old('title', $event->title) }}" autofocus="autofocus">
                            @if ($errors->has('title'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('title') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12 col-lg-12 col-sm-12 {{ $errors->has('organizer_id') ? ' has-error' : '' }}">
                                <label for="organizer_id">Organizer</label>
                                <select class="form-control" name="organizer_id">
                                    <option value="">Select</option>
                                    @foreach($organizers as $organizer)
                                    <option value="{{ $organizer->id }}" @if($event->organizer_id === $organizer->id) selected="selected" @endif>{{ $organizer->name }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('organizer_id'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('organizer_id') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-6 col-lg-6 col-sm-12 {{ $errors->has('category_id') ? ' has-error' : '' }}">
                                <label for="category_id">Category</label>
                                <select class="form-control" name="category_id">
                                    <option value="">Select</option>
                                    @foreach($categories as $category)
                                    <option value="{{ $category->id }}" @if($event->category_id === $category->id) selected="selected" @endif>{{ $category->name }}</option>
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
                                    <option value="{{ $eventtype->id }}" @if($event->event_type_id === $eventtype->id) selected="selected" @endif>{{ $eventtype->name }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('event_type_id'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('event_type_id') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-12 col-lg-12 col-sm-12 {{ $errors->has('venue_id') ? ' has-error' : '' }}">
                                <label for="venue_id">Venue</label>
                                <select class="form-control" name="venue_id">
                                    <option value="">Select</option>
                                    @foreach($venues as $venue)
                                    <option value="{{ $venue->id }}" @if($event->venue_id === $venue->id) selected="selected" @endif>{{ $venue->name }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('venue_id'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('venue_id') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-3 col-lg-3 col-sm-12 {{ $errors->has('from_date') ? ' has-error' : '' }}">
                                <label for="from_date">Start Date</label>
                                <input type="date" class="form-control" name="from_date" value="{{ old('from_date', $event->from_date) }}">
                                @if ($errors->has('from_date'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('from_date') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-3 col-lg-3 col-sm-12 {{ $errors->has('start_time') ? ' has-error' : '' }}">
                                <label for="start_time">Start Time</label>
                                <input type="time" class="form-control" name="start_time" value="{{ old('start_time', $event->start_time) }}">
                                @if ($errors->has('start_time'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('start_time') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-3 col-lg-3 col-sm-12 {{ $errors->has('to_date') ? ' has-error' : '' }}">
                                <label for="to_date">End Date</label>
                                <input type="date" class="form-control" name="to_date" value="{{ old('to_date', $event->to_date) }}">
                                @if ($errors->has('to_date'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('to_date') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-3 col-lg-3 col-sm-12 {{ $errors->has('end_time') ? ' has-error' : '' }}">
                                <label for="end_time">End Time</label>
                                <input type="time" class="form-control" name="end_time" value="{{ old('end_time', $event->end_time) }}">
                                @if ($errors->has('end_time'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('end_time') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group {{ $errors->has('website') ? ' has-error' : '' }}">
                            <label for="website">Website</label>
                            <input type="text" class="form-control" name="website" value="{{ old('website', $event->website) }}" autofocus="autofocus">
                            @if ($errors->has('website'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('website') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('short_desc') ? ' has-error' : '' }}">
                            <label for="short_desc">Short Description</label>
                            <textarea name="short_desc" rows="10" class="form-control">{{ old('short_desc', $event->short_desc) }}</textarea>
                            @if ($errors->has('short_desc'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('short_desc') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('long_desc') ? ' has-error' : '' }}">
                            <label for="long_desc">Long Description</label>
                            <textarea name="long_desc" rows="20" class="form-control">{{ old('long_desc', $event->long_desc) }}</textarea>
                            @if ($errors->has('long_desc'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('long_desc') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('cover_img') ? ' has-error' : '' }}">
                            <label for="cover_img">Cover Image</label>
                            <input type="file" class="form-control" name="image" value="{{ old('image') }}">
                            <img src="{{ url('storage/events/'. $event->cover_img) }}" style="width:100px; height: 100px;">
                            @if ($errors->has('logo'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('cover_img') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
