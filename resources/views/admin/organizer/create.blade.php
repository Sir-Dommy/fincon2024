@extends('layouts.admin')

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">

            <div class="card card-default">
                <div class="card-header d-flex justify-content-between">
                  <h4>Create Organizer</h4>
                  <a href="{{ route('admin.organizers.index') }}" class="btn btn-secondary">Back</a>
                </div>
                <div class="card-body">
                    <form action="{{ route('admin.organizers.store') }}" method="POST" enctype="multipart/form-data">
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
                            <div class="form-group col-md-6 col-lg-6 col-sm-12 {{ $errors->has('email') ? ' has-error' : '' }}">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" name="email" value="{{ old('email') }}">
                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-6 col-lg-6 col-sm-12 {{ $errors->has('phone') ? ' has-error' : '' }}">
                                <label for="phone">Phone</label>
                                <input type="tel" class="form-control" name="phone" value="{{ old('phone') }}">
                                @if ($errors->has('phone'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('phone') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group {{ $errors->has('website') ? ' has-error' : '' }}">
                            <label for="website">Website</label>
                            <input type="text" class="form-control" name="website" value="{{ old('website') }}">
                            @if ($errors->has('website'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('website') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4 col-lg-4 col-sm-12 {{ $errors->has('fb_page') ? ' has-error' : '' }}">
                                <label for="fb_page">Facebook Page</label>
                                <input type="text" class="form-control" name="fb_page" value="{{ old('fb_page') }}">
                                @if ($errors->has('fb_page'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('fb_page') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-4 col-lg-4 col-sm-12 {{ $errors->has('twitter_handle') ? ' has-error' : '' }}">
                                <label for="twitter_handle">Twitter Handle</label>
                                <input type="text" class="form-control" name="twitter_handle" value="{{ old('twitter_handle') }}">
                                @if ($errors->has('twitter_handle'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('twitter_handle') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-4 col-lg-4 col-sm-12 {{ $errors->has('youtube_channel') ? ' has-error' : '' }}">
                                <label for="youtube_channel">Youtube Channel</label>
                                <input type="text" class="form-control" name="youtube_channel" value="{{ old('youtube_channel') }}">
                                @if ($errors->has('youtube_channel'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('youtube_channel') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group {{ $errors->has('short_desc') ? ' has-error' : '' }}">
                            <label for="short_desc">Description</label>
                            <textarea name="short_desc" rows="5" class="form-control">{{ old('short_desc') }}</textarea>
                            @if ($errors->has('short_desc'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('short_desc') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('long_desc') ? ' has-error' : '' }}">
                            <label for="long_desc">Marketing Statement</label>
                            <textarea name="long_desc" rows="5" class="form-control">{{ old('long_desc') }}</textarea>
                            @if ($errors->has('long_desc'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('long_desc') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('logo') ? ' has-error' : '' }}">
                            <label for="logo">Profile Image</label>
                            <input type="file" class="form-control" name="image" value="{{ old('image') }}">
                            @if ($errors->has('logo'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('logo') }}</strong>
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
