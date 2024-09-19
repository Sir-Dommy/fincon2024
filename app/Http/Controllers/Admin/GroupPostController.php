<?php

namespace App\Http\Controllers\Admin;

use App\Models\Group;
use App\Models\Post;
use App\Models\GroupPost;
use App\Http\Requests;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class GroupPostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $post_id)
    {
        $post = Post::where('id', $post_id)->first();
        $post->groups()->attach($request->group_id);

        return redirect()->route('admin.posts.show', $post_id)->withSuccess('Post Group Added!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(PostTag $postgroup)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(PostTag $postgroup)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PostTag $postgroup)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function remove(Request $request, $group_id)
    {
        $post_id = $request->post_id;
        $post = Post::where('id', $post_id)->first();
        $post->groups()->detach($group_id);
        //$postgroup = PostTag::where('post_id', $post_id)->first();
        //dd($postgroup);
        //$postgroup->delete(true);
        return redirect()->route('admin.posts.show', $post_id)->withSuccess('Post Group Removed!');
    }
}
