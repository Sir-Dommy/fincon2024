<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Exhibitor extends Model
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
        'event_id', 'company', 'contact_person', 'phone', 'email', 'website', 'country', 'company_desc', 'status', 'company_logo'
    ];



    public function event()
    {
    	return $this->belongsTo('App\Models\Event', 'event_id');
    }
    

}
