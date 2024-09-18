<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Agenda extends Model
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
        'event_id', 'code', 'title', 'session_type', 'short_desc', 'session_date', 'from_time', 'to_time', 'position', 'venue_room_id', 'contact_person', 'phone', 'email', 'status', 'cover_img'
    ];



    public function event()
    {
    	return $this->belongsTo('App\Models\Event', 'event_id');
    }
    
    
    public function venueroom()
    {
    	return $this->belongsTo('App\Models\VenueRoom', 'venue_room_id');
    }

}
