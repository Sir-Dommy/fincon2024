<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Speaker extends Model
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
        'event_id', 'name', 'job_title', 'company', 'phone', 'email', 'website', 'yt_link', 'fb_link', 'ln_link', 'x_link', 'short_desc', 'long_desc', 'status', 'profile_img'
    ];



    public function event()
    {
    	return $this->belongsTo('App\Models\Event', 'event_id');
    }
    

}
