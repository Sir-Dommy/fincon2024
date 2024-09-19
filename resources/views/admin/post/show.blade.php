@extends('layouts.admin')

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">

            <div class="card card-default">
                <img src="{{ url('storage/posts/'. $post->cover_img) }}" class="card-img-top" alt="...">
                <div class="card-header d-flex justify-content-between">
                  <h4>{{ $post->title }}</h4>
                  <a href="{{ route('admin.posts.index') }}" class="btn btn-secondary">Back</a>
                </div>
                <div class="card-body">
                    <h5>Author: {{ $post->author }}</h5>
                    <p>{{ $post->short_desc }}</p>
                    <hr>
                    <p>{{ $post->long_desc }}</p>
                    <small class="float-right">{{ $post->updated_at }}</small>
                </div>

                @include('shared.notifications')

                <div class="card-header d-flex justify-content-between">
                    <h4>Groups</h4>
                    <a href="#AddGroup" data-toggle="modal" class="btn btn-primary btn-sm">Add Group</a>
                    <!-- Edit personal Information Modal -->
                    <div class="modal fade" id="AddGroup" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Add Group</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body p-5">
                                    <form action="{{ route('admin.groupposts.store', $post->id) }}" method="post">
                                        @csrf
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="name">Name</label>
                                                    <select name="group_id" class="form-control">
                                                        <option value="">Select</option>
                                                        @foreach($groups as $group)
                                                            <option value="{{ $group->id }}">{{ $group->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-success">Save</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($post->groups as $row1)
                            <tr>
                                <td>{{ $row1->name }}</td>
                                <td>
                                    <a href="#removePostGroup{{ $row1->id }}" data-toggle="modal">Remove</a>
                                        <div class="modal fade" id="removePostGroup{{ $row1->id }}" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Remove Post Group</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>You are about to remove this Post group?</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                                      
                                                        <form id="delete-post-group" action="{{ route('admin.groupposts.remove', $row1->id) }}" method="POST" class="form-inline">
                                            
                                                            {{ csrf_field() }}
                                                            <input type="hidden" name="post_id" value="{{ $post->id }}">
                                                            <input type="submit" value="Yes, Remove" class="btn btn-danger btn-xs pull-right btn-delete">
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="card-header d-flex justify-content-between">
                    <h4>Tags</h4>
                    <a href="#AddTag" data-toggle="modal" class="btn btn-primary btn-sm">Add Tag</a>
                    <!-- Edit personal Information Modal -->
                    <div class="modal fade" id="AddTag" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Add Tag</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body p-5">
                                    <form action="{{ route('admin.posttags.store', $post->id) }}" method="post">
                                        @csrf
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="name">Name</label>
                                                    <select name="tag_id" class="form-control">
                                                        <option value="">Select</option>
                                                        @foreach($tags as $tag)
                                                            <option value="{{ $tag->id }}">{{ $tag->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-success">Save</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($post->tags as $row)
                            <tr>
                                <td>{{ $row->name }}</td>
                                <td>
                                    <a href="#removePostTag{{ $row->id }}" data-toggle="modal">Remove</a>
                                        <div class="modal fade" id="removePostTag{{ $row->id }}" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Remove Post Tag</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>You are about to remove this Post tag?</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                                      
                                                        <form id="delete-post-tag" action="{{ route('admin.posttag.remove', $row->id) }}" method="POST" class="form-inline">
                                            
                                                            {{ csrf_field() }}
                                                            <input type="hidden" name="post_id" value="{{ $post->id }}">
                                                            <input type="submit" value="Yes, Remove" class="btn btn-danger btn-xs pull-right btn-delete">
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="card-header">
                    <h4>Comments</h4>
                </div>
                <div class="card-body">
                    <p>Comments list</p>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
