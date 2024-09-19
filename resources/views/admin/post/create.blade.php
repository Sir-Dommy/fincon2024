@extends('layouts.admin')

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">

            <div class="card card-default">
                <div class="card-header d-flex justify-content-between">
                  <h4>Create Post</h4>
                  <a href="{{ route('admin.posts.index') }}" class="btn btn-secondary">Back</a>
                </div>
                <div class="card-body">
                    <form action="{{ route('admin.posts.store') }}" method="POST" enctype="multipart/form-data">
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('title') ? ' has-error' : '' }}">
                            <label for="title">Title*</label>
                            <input type="text" class="form-control" name="title" value="{{ old('title') }}" autofocus="autofocus">
                            @if ($errors->has('title'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('title') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('author') ? ' has-error' : '' }}">
                            <label for="author">Author</label>
                            <input type="text" class="form-control" name="author" value="{{ old('author') }}" autofocus="autofocus">
                            @if ($errors->has('author'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('author') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('short_desc') ? ' has-error' : '' }}">
                            <label for="short_desc">Short Description</label>
                            <textarea name="short_desc" rows="5" class="form-control">{{ old('short_desc') }}</textarea>
                            @if ($errors->has('short_desc'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('short_desc') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('long_desc') ? ' has-error' : '' }}">
                            <label for="long_desc">Long Description</label>
                            <textarea name="long_desc" rows="10" class="form-control">{{ old('long_desc') }}</textarea>
                            @if ($errors->has('long_desc'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('long_desc') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('url_link') ? ' has-error' : '' }}">
                            <label for="url_link">URL Link</label>
                            <input type="text" class="form-control" name="url_link" value="{{ old('url_link') }}" autofocus="autofocus">
                            @if ($errors->has('url_link'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('url_link') }}</strong>
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
