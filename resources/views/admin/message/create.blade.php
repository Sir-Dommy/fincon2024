@extends('layouts.admin')

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">

            <div class="card card-default">
                <div class="card-header d-flex justify-content-between">
                  <h4>Compose Message</h4>
                  <a href="{{ route('admin.messaging.index') }}" class="btn btn-secondary">Back</a>
                </div>
                <div class="card-body">
                    <form action="{{ route('admin.messaging.store') }}" method="POST">
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="from_email">From*</label>
                            <input type="email" class="form-control" name="from_email" value="{{ old('name', 'support@fincon2024.co.ke') }}" readonly>
                        </div>
                        <div class="form-group {{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="to_email">To*</label>
                            <select name="to_email" class="form-control">
                                <option value="All">All Delegates</option>
                                @foreach($users as $user)
                                <option value="{{ $user->email }}">{{ $user->name }} - {{ $user->email }}</option>
                                @endforeach
                            </select>
                            @if ($errors->has('to_email'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('to_email') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('subject') ? ' has-error' : '' }}">
                            <label for="subject">Subject*</label>
                            <input type="text" class="form-control" name="subject" value="{{ old('subject') }}" required>
                            @if ($errors->has('subject'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('subject') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('message_content') ? ' has-error' : '' }}">
                            <label for="message_content">Message</label>
                            <textarea name="message_content" rows="5" class="form-control">{{ old('message_content') }}</textarea>
                            @if ($errors->has('message_content'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('message_content') }}</strong>
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
