<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Ticket extends Model
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
        'code', 'name', 'event_id', 'currency', 'price', 'purchase_from', 'purchase_to', 'pax', 'desc'
    ];



    public function event()
    {
    	return $this->belongsTo('App\Models\Event', 'event_id');
    }
    
    
    public function orderitems()
    {
    	return $this->hasMany('App\Models\OrderItem');
    }
}
