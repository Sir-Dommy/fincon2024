<?php

namespace App\Http\Controllers;

use Auth;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware(['auth', 'verified']);
    }
    
    
    
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function profile()
    {
        $data = [
            'user' => User::find(Auth::guard('web')->user()->id)
        ];
        return view('users.user-profile', $data);
    }

    /**
     * Update user details
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $user = User::find(Auth::guard('web')->user()->id);
        $user->fill($request->all());
        $user->save();
        
        return redirect()->route('user.profile.view')->withSuccess('Profile Updated Successfully!');
    }
}
