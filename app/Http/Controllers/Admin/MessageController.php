<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use App\Models\Message;
use App\Http\Requests;
use Illuminate\Http\Request;
use App\Mail\GeneralMessage;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Collection;

class MessageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'messages' => Message::latest()->paginate(10)
        ];
        return view('admin.message.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.message.create')->withUsers(User::get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Requests\StoreMessage $request)
    {
        $form = $request->all();
        
        //send emails
        if($request->to_email === 'All')
        {
            $users = User::where('is_active', 0)->orderBy('id')->chunk(100, function (Collection $users) {
                foreach ($users as $user) {
                    dd($users);
                    $email = Mail::to($user)->send(new GeneralMessage($user));
                    //dd($email);
                    if($email)
                    {
                        $user->is_active = 1;
                        $user->save();
                    } else {
                        $user->is_active = 2;
                        $user->save();
                    }
                }
            });
            
        } else {
            $user = User::where('email', $request->to_email)->first();
            $email = Mail::to($request->to_email)->send(new GeneralMessage($user));
            
            if($email)
            {
                $user->is_active = 1;
                $user->save();
            } else {
                $user->is_active = 2;
                $user->save();
            }
        }
        
        
        //save message
        $form['code'] = 'MSG-'.now();
        $message = Message::create($form);
        return redirect()->route('admin.messaging.index')->withSuccess('Message Sent!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        return view('admin.category.show')->withCategory($category);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit(Category $category)
    {
        return view('admin.category.edit')->withCategory($category);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Requests\UpdateCategory $request, Category $category)
    {
        $category->fill($request->all());
        $category->save();
        return redirect()->route('admin.categories.index')->withSuccess('Category Details Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {
        $category->delete(true);
        return redirect()->route('admin.categories.index')->withSuccess('Category Deleted!');
    }
}
