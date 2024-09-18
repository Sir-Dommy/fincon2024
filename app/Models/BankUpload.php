<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BankUpload extends Model
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
        'order_id', 'user_id', 'upload_file'
    ];
    
    
    public function order()
    {
    	return $this->belongsTo('App\Models\Order', 'order_id');
    }
    
    public function user()
    {
    	return $this->belongsTo('App\Models\User', 'user_id');
    }
    
}
