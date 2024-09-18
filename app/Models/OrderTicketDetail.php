<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrderTicketDetail extends Model
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
        'order_item_id', 'surname', 'other_names', 'email', 'phone', 'company', 'job_title', 'address', 'description'
    ];



    public function orderitem()
    {
    	return $this->belongsTo('App\Models\OrderItem', 'order_item_id');
    }
}
