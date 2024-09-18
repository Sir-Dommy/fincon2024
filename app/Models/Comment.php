<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Comment extends Model
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
        'post_id', 'comment', 'parent_id', 'user_id'
    ];



    public function parent()
    {
        return $this->belongsTo(self::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(self::class, 'parent_id');
    }


    
    public function post()
    {
    	return $this->belongsTo('App\Models\Post', 'post_id');
    }


    public function user()
    {
    	return $this->belongsTo('App\Models\User', 'user_id');
    }
}
