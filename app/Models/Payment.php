<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Payment extends Model
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
        'trans_code', 'order_id', 'paymode', 'currency', 'pay_amount', 'memo', 'pay_date', 'status'
    ];
    
    
    public function order()
    {
    	return $this->belongsTo('App\Models\Order', 'order_id');
    }
    
}
