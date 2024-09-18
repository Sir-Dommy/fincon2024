<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Event extends Model
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
        'code', 'title', 'slug', 'category_id', 'event_type_id', 'organizer_id', 'venue_id', 'from_date', 'start_time', 'to_date', 'end_time', 'address_address', 'address_latitude', 'address_longitude', 'website', 'short_desc', 'long_desc', 'cover_img'
    ];


    public function category()
    {
    	return $this->belongsTo('App\Models\Category', 'category_id');
    }

    public function eventtype()
    {
    	return $this->belongsTo('App\Models\EventType', 'event_type_id');
    }

    public function organizer()
    {
    	return $this->belongsTo('App\Models\Organizer', 'organizer_id');
    }

    public function venue()
    {
    	return $this->belongsTo('App\Models\Venue', 'venue_id');
    }


    public function tickets()
    {
    	return $this->hasMany('App\Models\Ticket');
    }
    
    public function speakers()
    {
    	return $this->hasMany('App\Models\Speaker');
    }
    
    public function agendas()
    {
    	return $this->hasMany('App\Models\Agenda');
    }
    
    public function exhibitors()
    {
    	return $this->hasMany('App\Models\Exhibitor');
    }
    
    public function partners()
    {
    	return $this->hasMany('App\Models\Partner');
    }
}
