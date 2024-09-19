@extends('layouts.admin')

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">

            <div class="card card-default">
                <div class="card-header d-flex justify-content-between">
                  <h4>Edit Event Category - {{ $category->name }}</h4>
                  <a href="{{ route('admin.categories.index') }}" class="btn btn-secondary">Back</a>
                </div>
                <div class="card-body">
                    <form action="{{ route('admin.categories.update', $category) }}" method="POST">
                        {{ csrf_field() }}
                        <input type="hidden" name="_method" value="patch">

                        <div class="form-group {{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="name">Name*</label>
                            <input type="text" class="form-control" name="name" value="{{ old('name', $category->name) }}" autofocus="autofocus">
                            @if ($errors->has('name'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('name') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('desc') ? ' has-error' : '' }}">
                            <label for="desc">Description</label>
                            <textarea name="desc" rows="5" class="form-control">{{ old('desc', $category->desc) }}</textarea>
                            @if ($errors->has('desc'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('desc') }}</strong>
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
