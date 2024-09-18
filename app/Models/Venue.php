<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Venue extends Model
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
        'name', 'desc', 'phone', 'email', 'location_id', 'url_link', 'cover_img'
    ];



    public function location()
    {
    	return $this->belongsTo('App\Models\Location', 'location_id');
    }




    public function events()
    {
    	return $this->hasMany('App\Models\Event');
    }
    
    
    public function rooms()
    {
    	return $this->hasMany('App\Models\VenueRoom');
    }
}
