<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Organizer extends Model
{
    use SoftDeletes;

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = [
        'deleted_at'
    ];

    /**
     * setup variable mass assignment.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'phone', 'email', 'website', 'fb_page', 'twitter_handle', 'youtube_channel', 'short_desc', 'long_desc', 'logo', 'user_id'
    ];



    public function events()
    {
    	return $this->hasMany('App\Models\Event');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }
}
