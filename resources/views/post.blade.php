@extends('layouts.business')

@section('title', 'Blog')

@section('description', 'Meetings &amp; Exhibition Africa is a global publication organization that allows content creators to express their ideas and experiences on what goes on in the field of Events, Meetings and Exhibitions happening in Africa.')

@section('content')

    <div class="jumbotron jumbotron-fluid bg-white mb-5">
    <div class="container">
      <div class="row">
          <div class="col-md-12">
              <h3>BLOG</h3>
          </div>
      </div>
    </div>
  </div>

    <section class="posts-grid bg-light">
    <div class="container p-0">

      <div class="row">
        <div class="col-md-8 col-lg-8 col-sm-12">
            <div class="row">
              <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="card mb-5">
                  <img src="{{ url('storage/posts/'. $post->cover_img) }}" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h4 class="card-title"> {{ $post->title }} </h4>
                    <div class="bg-light p-3 d-flex justify-content-between">
                      <p>By <b>{{ $post->author }}</b> on {{ \Carbon\Carbon::parse($post->created_at)->format('D, M d, Y g:i A')}}</p>
                      <div class="tags">
                        @foreach($post->tags as $tag)
                          <div class="badge badge-primary">{{ $tag->name }}</div>
                        @endforeach
                      </div>
                    </div>
                    <p>{!! $post->long_desc !!}</p>
                  </div>
                  <hr>
                  <div class="card-body">
                    <h4 class="card-title">Comments</h4>

                    @include('shared.notifications')

                    @foreach($comments as $comment)
                    <div class="media">
                      <img src="{{ asset('img/user-default.png') }}" class="mr-3" alt="..." style="width: 90px; height: 90px;">
                      <div class="media-body">
                        <h5 class="mt-0">{{ $comment->user->name }}</h5>
                        <p>{{ $comment->comment }}</p>

                        @php
                          $sub_comments = App\Models\Comment::where('parent_id', $comment->id)->get();
                        @endphp
                        @foreach($sub_comments as $subcom)
                        <div class="media mt-3">
                          <a class="mr-3" href="#">
                            <img src="{{ asset('img/user-default.png') }}" alt="..." style="width: 90px; height: 90px;">
                          </a>
                          <div class="media-body">
                            <h5 class="mt-0">{{ $subcom->user->name }}</h5>
                            <p>{{ $subcom->comment }}</p>
                          </div>
                        </div>
                        @endforeach

                        @guest

                        @else
                        <form action="{{ route('subcomments.store') }}" method="POST">
                          {{ csrf_field() }}

                          <input type="hidden" name="slug" value="{{ $post->slug }}">
                          <input type="hidden" name="post_id" value="{{ $post->id }}">
                          <input type="hidden" name="parent_id" value="{{ $comment->id }}">
                          <div class="input-group mb-3">
                            <textarea name="comment" class="form-control" placeholder="Comment...">{{ old('comment') }}</textarea>
                            <div class="input-group-append">
                              <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Submit</button>
                            </div>
                          </div>
                        </form>
                        @endguest
                      </div>
                    </div>
                    @endforeach
                  </div>
                  <div class="card-body">
                    <h4 class="card-title">Leave a Comment</h4>
                  
                    @guest
                    <form action="{{ route('guest.comments.store') }}" method="POST">
                      {{ csrf_field() }}

                      <input type="hidden" name="slug" value="{{ $post->slug }}">
                      <input type="hidden" name="post_id" value="{{ $post->id }}">
                      <div class="form-group">
                        <label>Your Name</label>
                        <input type="text" name="name" class="form-control" value="{{ old('name') }}">
                      </div>
                      <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="email" class="form-control" value="{{ old('email') }}">
                      </div>
                      <div class="form-group">
                        <label>Phone</label>
                        <input type="tel" name="phone" class="form-control" value="{{ old('phone') }}">
                      </div>
                      <div class="form-group">
                        <label>Message</label>
                        <textarea name="comment" class="form-control" rows="5">{{ old('comment') }}</textarea>
                      </div>
                      <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block">Submit</button>
                      </div>
                    </form>
                    @else
                      <form action="{{ route('comments.store') }}" method="POST">
                        {{ csrf_field() }}

                        <input type="hidden" name="slug" value="{{ $post->slug }}">
                        <input type="hidden" name="post_id" value="{{ $post->id }}">
                        <div class="form-group">
                          <label>Message</label>
                          <textarea name="comment" class="form-control" rows="5">{{ old('comment') }}</textarea>
                        </div>
                        <div class="form-group">
                          <button type="submit" class="btn btn-primary btn-block">Submit</button>
                        </div>
                      </form>
                    @endguest
                  </div>
                </div>
              </div>
            </div>
        </div>

        <div class="col-md-4 col-lg-4 col-sm-12">
          <div class="card">
            <h4 class="p-3">Groups</h4>
            <ul class="list-group list-group-flush">
              @foreach($groups as $group)
              <li class="list-group-item"><a href="{{ route('posts.groups', $group->id) }}">{{ $group->name }}</a></li>
              @endforeach
            </ul>
          </div>
        </div>
      </div>

    </div>
  </section>

@endsection
