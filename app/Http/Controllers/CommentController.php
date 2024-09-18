<?php

namespace App\Http\Controllers;

use Auth;
use App\Models\User;
use App\Models\Comment;
use App\Http\Requests;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use App\Mail\CommentSubmitted;

class CommentController extends Controller
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
    public function gueststore(Requests\StoreGuestComment $request)
    {
        $random_pass = Str::random(8);
        $slug = $request->slug;

        //create a user
        $form = $request->all();
        $form['password'] = Hash::make($random_pass);
        $user = User::create($form);

        $form1 = $request->all();
        $form1['user_id'] = $user->id;
        $comment = Comment::create($form1);

        //send email
        Mail::to($request->email)->send(new  CommentSubmitted($user));

        return redirect()->route('posts.show', $slug)->withSuccess('Comment Posted!');

    }



    public function store(Requests\StoreComment $request)
    {
        $random_pass = Str::random(8);
        $slug = $request->slug;

        $form1 = $request->all();
        $form1['user_id'] = Auth::guard('web')->user()->id;
        $comment = Comment::create($form1);

        return redirect()->route('posts.show', $slug)->withSuccess('Comment Posted!');

    }


    public function subcommentstore(Requests\StoreComment $request)
    {
        $random_pass = Str::random(8);
        $slug = $request->slug;

        $form1 = $request->all();
        $form1['user_id'] = Auth::guard('web')->user()->id;
        $comment = Comment::create($form1);

        return redirect()->route('posts.show', $slug)->withSuccess('Comment Posted!');

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function show(Comment $comment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function edit(Comment $comment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Comment $comment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Comment $comment)
    {
        //
    }
}
