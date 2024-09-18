<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class PasswordController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($user_id)
    {
        $user = User::find($user_id);
        $user->email_verified_at = Carbon::now()->toDateTimeString();
        $user->user_verified_at = Carbon::now()->toDateTimeString();
        $user->save();

        return view('set-password')->withUser($user);
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
    public function store(Requests\SetPassword $request)
    {
        $user = User::find($request->user_id);
        $user->password = Hash::make($request->password);
        $user->save();

        return redirect()->route('login');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Password  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Password $category)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Password  $category
     * @return \Illuminate\Http\Response
     */
    public function edit(Password $category)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Password  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Password $category)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Password  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Password $category)
    {
        //
    }
}
