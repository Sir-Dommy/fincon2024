<?php

namespace App\Http\Controllers\Admin;

use Auth;
use App\Models\Tag;
use App\Models\Post;
use App\Models\Group;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'posts' => Post::latest()->paginate(10)
        ];
        return view('admin.post.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.post.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Requests\StorePost $request)
    {
        $this->validate($request, [

            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048'

        ]);
        $file = $request->file('image');
        $ext = $file->getClientOriginalExtension();
        $slug = Str::slug($request['title']);
        $cover_img_image_path = date('dmy').$slug . '.' . $ext;
        $path = Storage::putFileAs('/public/posts/', $file, $cover_img_image_path, 'public');
        $form = $request->all();
        if ($path) {
            $form['cover_img'] = $cover_img_image_path;
        }
        $form['slug'] = $slug;
        $form['admin_id'] = Auth::guard('admin')->user()->id;
        $post = Post::create($form);
        return redirect()->route('admin.posts.index')->withSuccess('Post Created!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        return view('admin.post.show')->withPost($post)->withTags(Tag::all())->withGroups(Group::all());
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        return view('admin.post.edit')->withPost($post);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\UpdatePost $request, Post $post)
    {
        $post->fill($request->all());
        $slug = Str::slug($request['title']);
        if($request->hasFile('image')) {   

            //remove previous file
            Storage::delete('/public/posts/'. $post->cover_img);

            //upload new one
            $this->validate($request, [

                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',

            ]);

            $file = $request->file('image');
            $ext = $file->getClientOriginalExtension();

            $cover_img_image_path = date('dmy').$slug . '.' . $ext;

            $path = Storage::putFileAs('/public/posts/', $file, $cover_img_image_path, 'public');
            //dd($path);

            $post->cover_img = $cover_img_image_path;                                                                                                   
        }
        $post->slug = $slug;
        $post->save();
        return redirect()->route('admin.posts.index')->withSuccess('Post Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        //remove file
        Storage::delete('/public/posts/'. $post->cover_img);
        $post->delete(true);
        return redirect()->route('admin.posts.index')->withSuccess('Post Deleted!');
    }
}
