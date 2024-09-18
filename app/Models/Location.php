<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Location extends Model
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
        'name', 'desc', 'country'
    ];


    public function venues()
    {
    	return $this->hasMany('App\Models\Location');
    }



    public function events()
    {
        return $this->hasManyThrough('App\Models\Event', 'App\Models\Venue', 'location_id', 'venue_id', 'id', 'id');
    }
}
