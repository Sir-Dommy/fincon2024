<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrderItem extends Model
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
        'order_id', 'ticket_id', 'qty', 'currency', 'price', 'comments'
    ];
    
    
    
    public function order()
    {
    	return $this->belongsTo('App\Models\Order', 'order_id');
    }
    
    public function ticket()
    {
    	return $this->belongsTo('App\Models\Ticket', 'ticket_id');
    }
}
