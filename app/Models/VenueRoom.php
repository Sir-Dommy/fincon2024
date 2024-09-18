<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class VenueRoom extends Model
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
        'venue_id', 'name', 'description', 'address', 'size', 'max_capacity', 'auditorium', 'classroom', 'u_shape', 'reception', 'banquet', 'cover_img', 'published'
    ];
    
    
    public function venue()
    {
    	return $this->belongsTo('App\Models\Venue', 'venue_id');
    }
    
    public function agendas()
    {
    	return $this->hasMany('App\Models\Agenda');
    }
}
