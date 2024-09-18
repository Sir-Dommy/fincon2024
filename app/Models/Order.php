<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
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
        'trans_code', 'user_id', 'event_id', 'comments'
    ];
    
    
    public function event()
    {
    	return $this->belongsTo('App\Models\Event', 'event_id');
    }
    
    public function user()
    {
    	return $this->belongsTo('App\Models\User', 'user_id');
    }
    
    
    public function orderitems()
    {
    	return $this->hasMany('App\Models\OrderItem');
    }
    
    public function payments()
    {
    	return $this->hasMany('App\Models\Payment');
    }
}
