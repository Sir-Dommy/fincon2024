@extends('layouts.admin')

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">

            <div class="card card-default">
                <div class="card-header d-flex justify-content-between">
                  <h4>Create Venue</h4>
                  <a href="{{ route('admin.venues.index') }}" class="btn btn-secondary">Back</a>
                </div>
                <div class="card-body">
                    <form action="{{ route('admin.venues.store') }}" method="POST" enctype="multipart/form-data">
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="name">Name*</label>
                            <input type="text" class="form-control" name="name" value="{{ old('name') }}" autofocus="autofocus">
                            @if ($errors->has('name'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('name') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6 col-lg-6 col-sm-12">
                                <label>Phone</label>
                                <input type="tel" name="phone" value="{{ old('phone') }}" class="form-control">
                                @if ($errors->has('phone'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('phone') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-6 col-lg-6 col-sm-12">
                                <label>Email</label>
                                <input type="email" name="email" value="{{ old('email') }}" class="form-control">
                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group {{ $errors->has('url_link') ? ' has-error' : '' }}">
                            <label for="url_link">Website Url</label>
                            <input type="text" class="form-control" name="url_link" value="{{ old('url_link') }}" autofocus="autofocus">
                            @if ($errors->has('url_link'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('url_link') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('location_id') ? ' has-error' : '' }}">
                            <label for="location_id">Location</label>
                            <select name="location_id" class="form-control">
                                <option value="">Select</option>
                                @foreach($locations as $location)
                                <option value="{{ $location->id }}">{{ $location->name }}</option>
                                @endforeach
                            </select>
                            @if ($errors->has('location_id'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('location_id') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('desc') ? ' has-error' : '' }}">
                            <label for="desc">Description</label>
                            <textarea name="desc" rows="5" class="form-control">{{ old('desc') }}</textarea>
                            @if ($errors->has('desc'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('desc') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('image') ? ' has-error' : '' }}">
                            <label for="image">Cover Image</label>
                            <input type="file" class="form-control" name="image" value="{{ old('image') }}">
                            @if ($errors->has('image'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('image') }}</strong>
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
    </div>
</div>
@endsection
