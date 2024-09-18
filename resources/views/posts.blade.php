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
              @foreach($posts as $post)
              <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="card mb-5">
                  <img src="{{ url('storage/posts/'. $post->cover_img) }}" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h4 class="card-title"><a href="{{ route('posts.show', $post->slug) }}"> {{ $post->title }} </a></h4>
                    
                    <p>{{ $post->short_desc }}</p>
                  </div>
                  <div class="card-footer d-flex justify-content-between">
                    <p>By <b>{{ $post->author }}</b> on {{ \Carbon\Carbon::parse($post->created_at)->format('D, M d, Y g:i A')}}</p>
                    <div class="tags">
                      @foreach($post->tags as $tag)
                        <div class="badge badge-primary">{{ $tag->name }}</div>
                      @endforeach
                    </div>
                  </div>
                </div>
              </div>
              @endforeach
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
